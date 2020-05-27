#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# get remote repo path
remotes=(`git remote -v`)
remote_path=${remotes[1]#*.com/}

# navigate into the build output directory
cd dist

# init dist sub-repo
git init
git add -A
git commit -m 'deploy'

# deploy to https://<USERNAME>.github.io/<REPO>
git push -f "git@github.com:$remote_path" master:gh-pages

cd -