#!/bin/bash -xe

mkdir -m 700 -p ~/.ssh/
cat >> ~/.ssh/config << EOF
StrictHostKeyChecking no
EOF
chmod 600 ~/.ssh/config

export SMOKE_BRANCH="smoke_test/${CIRCLE_SHA1}"

git clone git@github.com:sue445/circleci-orb-bundle-install-test.git /tmp/circleci-orb-bundle-install-test

cd /tmp/circleci-orb-bundle-install-test

git config push.default current
git config user.name "CircleCI"
git config user.email ${EMAIL}

git checkout -b smoke_test/${CIRCLE_SHA1}

sed -i -e "s/@volatile/@dev:${CIRCLE_SHA1}/g" .circleci/config.yml
git add .circleci/config.yml
git commit -m "Update from ${CIRCLE_BUILD_URL}"

git push -f origin
