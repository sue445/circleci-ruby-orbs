# circleci-ruby-orbs
CircleCI orb for ruby

https://circleci.com/orbs/registry/orb/sue445/ruby-orbs

[![CircleCI Orb Version](https://img.shields.io/badge/endpoint.svg?url=https://badges.circleci.io/orb/sue445/ruby-orbs)](https://circleci.com/orbs/registry/orb/sue445/ruby-orbs) 
[![CircleCI](https://circleci.com/gh/sue445/circleci-ruby-orbs/tree/master.svg?style=svg)](https://circleci.com/gh/sue445/circleci-ruby-orbs/tree/master)


## Requirements
* Ruby and bundler
  * recommend [circleci/ruby](https://hub.docker.com/r/circleci/ruby/)

## Usage
### Common setting
```yml
# .circleci/config.yml
version: 2.1

orbs:
  # Use specific version
  # see. https://github.com/sue445/circleci-ruby-orbs/releases
  ruby-orbs: sue445/ruby-orbs@1.4.4

  # or
  # Use latest version
  # ruby-orbs: sue445/ruby-orbs@volatile
```

### bundle-install
Run `bundle install` using cache.

#### for app repo (`Gemfile.lock` is committed)
```yml
# .circleci/config.yml
jobs:
  rspec:
    docker:
      - image: circleci/ruby

    steps:
      - checkout

      - ruby-orbs/bundle-install
      # or
      - ruby-orbs/bundle-install:
          cache_key_prefix: "v1-bundle"
          bundle_jobs: 4
          bundle_retry: 3
          bundle_path: "vendor/bundle"
          bundle_gemfile: "Gemfile"
          bundle_clean: true
          bundle_extra_args: ""
          restore_bundled_with: true

      # Add your job (e.g. rspec, rubocop)
      - run: bundle exec rspec
```

#### for gem repo (`Gemfile.lock` is not committed)
```yml
# .circleci/config.yml
jobs:
  rspec:
    docker:
      - image: circleci/ruby

    steps:
      - checkout

      - ruby-orbs/bundle-install:
          with_gemfile_lock: false
          gemspec_name: "yourgem"
      # or
      - ruby-orbs/bundle-install:
          with_gemfile_lock: false
          gemspec_name: "yourgem"
          cache_key_prefix: "v1-bundle"
          bundle_jobs: 4
          bundle_retry: 3
          bundle_path: "vendor/bundle"
          bundle_clean: true
          bundle_extra_args: ""
          update_always: false

      # Add your job (e.g. rspec, rubocop)
      - run: bundle exec rspec
```

#### Parameters
* `cache_key_prefix` : Key prefix of cache (default: `v1-bundle`)
* `bundle_jobs` : Passed to `bundle install --jobs` (default: `4`)
* `bundle_retry` : Passed to `bundle install --retry` (default: `3`)
* `bundle_path` : Passed to `bundle install --path` or use `bundle config set path` (default: `vendor/bundle`)
* `bundle_gemfile` : Passed to `bundle install --gemfile` (default: `Gemfile`)
* `bundle_clean` : Whether pass `--clean` to `bundle install` or use `bundle config set --local clean 'true'` (default: `true`)
* `bundle_extra_args` : Arguments to pass to `bundle install`
* `restore_bundled_with` : Whether resolve bundler version difference between `Gemfile.lock` and pre-installed in CI (default: `true`)
* `with_gemfile_lock` : Whether using `Gemfile.lock` for cache key (default: `true`)
* `gemspec_name` : gemspec name (required if `with_gemfile_lock` is false)
* `update_always` : Whether run always `bundle update` when `with_gemfile_lock` is disabled (default: `false`)

### bundle-update-pr
Run `bundle update` and send PullRequest.

Uses https://github.com/masutaka/circleci-bundle-update-pr

```yml
workflows:
  version: 2
  nightly:
    triggers:
      - schedule:
          cron: "00 10 * * 5"
          filters:
            branches:
              only: master
    jobs:
      - ruby-orbs/bundle-update-pr
      # or
      - ruby-orbs/bundle-update-pr:
          image: "circleci/ruby:2.5.3"
          pre-bundle-update-pr:
            - run:
                name: "Set timezone to Asia/Tokyo"
                command: "sudo cp /usr/share/zoneinfo/Asia/Tokyo /etc/localtime"
            - ruby-orbs/bundle-install
          git_user_name: "yourname"
          git_user_email: "you@example.com"
          github_access_token: GITHUB_ACCESS_TOKEN
```

#### Parameters
* `image` : Image for `bundle update` (default: `circleci/ruby`)
* `pre-bundle-update-pr` : Run steps before `circleci-bundle-update-pr` (default: `[]`)
* `post-bundle-update-pr` : Run steps after `circleci-bundle-update-pr` (default: `[]`)
* `version` : circleci-bundle-update-pr vesion. default is latest
* `assignees` : Assign the PR to them. (e.g. alice,bob,carol)
* `reviewers` : Request PR review to them. (e.g. alice,bob,carol)
* `labels` : Add labels to the PR (e.g. In Review, Update)
* `duplicate` : Make PR even if it has already existed (default: `false`)
* `git_user_name` : Username for commit (default: `$GIT_USER_NAME`)
* `git_user_email` : E-mail for commit (default: `$GIT_USER_EMAIL`)
* `branch` : Space separated branches. (e.g. `master develop topic`) (default: `$CIRCLE_BRANCH`)
* `github_access_token` : Your GitHub personal access token as an env var on CircleCI (default: `GITHUB_ACCESS_TOKEN`)
  * Go to [your account's settings page](https://github.com/settings/tokens/new?description=circleci-bundle-update-pr%20token) and generate a personal access token with "repo" scope
  * Use the CircleCI UI to set the GITHUB_ACCESS_TOKEN environment variable.
* `enterprise_octokit_access_token` : Your GitHub Enterprise personal access token as an env var on CircleCI (default. `ENTERPRISE_OCTOKIT_ACCESS_TOKEN`)
  * Use the CircleCI UI to set the ENTERPRISE_OCTOKIT_ACCESS_TOKEN environment variable.
* `enterprise_octokit_api_endpoint` : Your GitHub Enterprise api endpoint (e.g. https://www.example.com/api/v3) (default: `$ENTERPRISE_OCTOKIT_API_ENDPOINT`)
* `no_output_timeout` : Elapsed time the command can run without output. (e.g. 20m, 1.25h, 5s) (default: `10m`)

## External
* Smoke test repository for circleci-ruby-orbs
  * https://github.com/sue445/circleci-ruby-orbs-test
