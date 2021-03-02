# repos
A super-module of all the repositories in use

## Setup

For all repositories, you will want to add an "upstream" remote which
contains the the source branch that you are looking to release. Where
upstream and origin are the same, you'll likely want *both*.

## Release steps

### Update tag.sh

Update PREVIOUS, UPCOMING and MESSAGE variables for tagging the repositories

### Checkout the associated branches

    git submodule foreach git fetch upstream
    cd openmicroscopy/
    git checkout upstream/metadata52
    # etc for all repos

### Bump the release number and commit changes

    # edit PREVIOUS, VERSION and MESSAGE in tag.sh
    git commit -a -m "Updating all repos for IDR x.y.z"

### Tag and push all subcomponents

    git submodule foreach $PWD/tag.sh

### Tag an push the super repository

    git tag -s -m "IDR x.y.z - short description" x.y.z
    git push origin x.y.z master
