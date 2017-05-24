#!/bin/bash

if [[ $TRAVIS_BRANCH == 'master' ]] ; then

  jekyll clean
  JEKYLL_ENV=PRODUCTION jekyll build
  cd _site
  git init

  git config user.name "Travis CI"
  git config user.email "feriese@microsoft.com"

  git add .
  git commit -m "Deploy"

  # We redirect any output to
  # /dev/null to hide any sensitive credential data that might otherwise be exposed.
  git push --force --quiet "https://${git_user}:${git_password}@${git_target}" master:gh_pages > /dev/null 2>&1
else
  echo 'Invalid branch. You can only deploy from gh-pages.'
  exit 1
fi