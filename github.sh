#!/bin/bash

if git push origin master
then
    echo "Files uploaded to Github"
else
    echo "Unable to upload files to Github"
fi

sleep 2

# Pull request
#if git pull origin master 
#then
    #echo "Files are synced with Github"
#else
    #echo "Unable to sync files to Github"
#fi
