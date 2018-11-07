# circleci-orb-bundle-install
[![CircleCI](https://circleci.com/gh/sue445/circleci-orb-bundle-install/tree/master.svg?style=svg&circle-token=b1e09093e5f09f91180578edef6fa57e442d11e1)](https://circleci.com/gh/sue445/circleci-orb-bundle-install/tree/master)

## Usage
### bundle-install
```yml
# .circleci/config.yml
version: 2.1

orbs:
  sue445-bundle-install: sue445/bundle-install@volatile
  
jobs:
  rspec:
    steps:
      - checkout

      - sue445-bundle-install/bundle-install
      # or
      - sue445-bundle-install/bundle-install:
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
