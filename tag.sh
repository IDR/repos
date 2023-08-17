#!/bin/bash

PREVIOUS=0.11.7
UPCOMING=0.11.8
MESSAGE="Tagging $UPCOMING: prod118 release"

# Usage:
# 0. Update the variables above!
# 1. Checkout the commit to be tagged in all repositories.
# 2. Run `git submodule foreach $PWD/tag.sh`
# 3

git remote get-url origin | grep -E "(idr-metadata|idr/repos)" && {
  # No prefix for idr-metadata or the top-level
  OLD=$PREVIOUS
  NEW=$UPCOMING
} || {
  OLD=IDR-$PREVIOUS
  NEW=IDR-$UPCOMING
}

git rev-parse "$NEW" >/dev/null 2>&1 && {
  echo $NEW exists
} || {
  echo Creating $NEW
  git tag -s -m "$MESSAGE" $NEW
  git push origin $NEW
}
