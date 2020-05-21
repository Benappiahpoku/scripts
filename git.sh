#!/bin/bash

# git add and commit + second parameter for argument
git add .;
git commit -m "update commit $1";
echo "Files uploaded to local repository"

sleep 1

# Git push to the remote repository 
if git push origin master
then
    echo "Files uploaded to Github"
    # sleep 1 
    # git pull origin master
    # echo "Files synced with Github"
else
    echo "Unable to upload files to Github"
fi
