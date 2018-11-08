# circleci-ruby-orbs
CircleCI orb for ruby

https://circleci.com/orbs/registry/orb/sue445/ruby-orbs

[![CircleCI](https://circleci.com/gh/sue445/circleci-ruby-orbs/tree/master.svg?style=svg)](https://circleci.com/gh/sue445/circleci-ruby-orbs/tree/master)


## Requirements
* Ruby and bundler
  * recommend [circleci/ruby](https://hub.docker.com/r/circleci/ruby/)
* `Gemfile.lock` in repo
  * Not supported if `Gemfile.lock` is not committed (e.g. gem repo)

## Usage
### bundle-install
```yml
# .circleci/config.yml
version: 2.1

orbs:
  ruby-orbs: sue445/ruby-orbs@1.0.1

jobs:
  rspec:
    steps:
      - checkout

      - ruby-orbs/bundle-install
      # or
      - ruby-orbs/bundle-install:
          cache_key_prefix: "v1-bundle"
          bundle_jobs: 4
          bundle_retry: 3
          bundle_path: "vendor/bundle"
          bundle_clean: true
          bundle_extra_args: ""
          restore_bundled_with: true

      # Add your job (e.g. rspec, rubocop)
      - run: bundle exec rspec
```

## Parameters
* `cache_key_prefix` : Key prefix of cache (default: `v1-bundle`)
* `bundle_jobs` : Passed to `bundle install --jobs` (default: `4`)
* `bundle_retry` : Passed to `bundle install --retry` (default: `3`)
* `bundle_path` : Passed to `bundle install --path` (default: `vendor/bundle`)
* `bundle_clean` : Whether pass `--clean` to `bundle install` (default: `true`)
* `bundle_extra_args` : Arguments to pass to `bundle install` (defaut: `""`)
* `restore_bundled_with` : Whether resolve bundler version difference between `Gemfile.lock` and pre-installed in CI (default: `true`)
