#! /bin/bash
echo "Commit:"
read message

echo "Updating public submodule"
rm -rf public/*
hugo --buildDrafts
cd public
git add .
git commit -m "${message}"
git push origin master

echo "Push all changes in main repository"
cd ../
git add --all
git commit -m "${message}"
git push origin master
echo "🦎"
