## Unreleased
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.6.0...master)

## v1.6.0
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.5.2...1.6.0)

### `bundle-install`
* Resolved deprecation warning on bundler 2.1+
    * https://github.com/sue445/circleci-ruby-orbs/pull/54
* Add params
    * https://github.com/sue445/circleci-ruby-orbs/pull/60
    * Add followings
        * `bundle_deployment`
        * `bundle_frozen`
        * `bundle_no_cache`
        * `bundle_no_prune`
        * `bundle_shebang`
        * `bundle_system`
        * `bundle_without`
        * `bundle_with`

## v1.5.2
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.5.0...1.5.2)

### `bundle-install`
* Revert "Support bundler v2.1"
  * https://github.com/sue445/circleci-ruby-orbs/pull/52
  * :warning: v1.5.0 changes were reverted :pensive:

## v1.5.0
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.4.4...1.5.0)

### `bundle-install`
* Support bundler v2.1
    * https://github.com/sue445/circleci-ruby-orbs/pull/49
    * Add followings params
        * `bundle_deployment`
        * `bundle_frozen`
        * `bundle_no_cache`
        * `bundle_no_prune`
        * `bundle_shebang`
        * `bundle_system`
        * `bundle_without`
        * `bundle_with`

## v1.4.4
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.4.3...1.4.4)

### `bundle-update-pr`
* fix: use env_var_name instead of string to secure sensitive data
  * https://github.com/sue445/circleci-ruby-orbs/pull/45

## v1.4.3
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.4.2...1.4.3)

### `bundle-install`
* Bugfix. fix typo in `bundle install`
  * https://github.com/sue445/circleci-ruby-orbs/pull/41

## v1.4.2
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.4.0...1.4.2)

### `bundle-install`
* Add `update_always` param to `bundle-install`
  * https://github.com/sue445/circleci-ruby-orbs/pull/40

## v1.4.0
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.3.10...1.4.0)

### `bundle-install`
* Supports repo without `Gemfile.lock`
  * https://github.com/sue445/circleci-ruby-orbs/pull/39

## v1.3.10
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.3.9...1.3.10)

### `bundle-update-pr`
* Fixed. can't expand environment variable
  * https://github.com/sue445/circleci-ruby-orbs/pull/38

## v1.3.9
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.3.8...1.3.9)

### `bundle-update-pr`
* Fixup PR #34 (Allow white space in git username)
  * https://github.com/sue445/circleci-ruby-orbs/pull/37

## v1.3.8
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.3.7...1.3.8)

### `bundle-update-pr`
* Change default value for `branch` parameter to CI current branch
  * https://github.com/sue445/circleci-ruby-orbs/pull/36
  * https://github.com/sue445/circleci-ruby-orbs/issues/35

## v1.3.7
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.3.6...1.3.7)

### `bundle-update-pr`
* Allow white space in git username
  * https://github.com/sue445/circleci-ruby-orbs/pull/34

## v1.3.0
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.2.0...1.3.0)

### `bundle-update-pr`
* Add `bundle-update-pr`
  * https://github.com/sue445/circleci-ruby-orbs/pull/26
  * https://github.com/sue445/circleci-ruby-orbs/pull/27
  * https://github.com/sue445/circleci-ruby-orbs/pull/28

## v1.2.0
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.1.2...1.2.0)

### `bundle-install`
* Add `bundle_gemfile`
  * https://github.com/sue445/circleci-ruby-orbs/pull/21

## v1.1.1
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.1.0...1.1.1)

### `bundle-install`
* Tweak cache key format
  * https://github.com/sue445/circleci-ruby-orbs/pull/19

## v1.1.0
[full changelog](http://github.com/sue445/circleci-ruby-orbs/compare/1.0.0...1.1.0)

### `bundle-install`
* Add branch name to cache key
  * https://github.com/sue445/circleci-ruby-orbs/pull/16

## v1.0.0
* first release
