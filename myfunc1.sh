#!/bin/bash

# SET OF CUSTOM FUNCTIONS #

# shutdown function
function shut {
   shutdown now;  
}

# restart function 
function restart {
    shutdown -r now;
}

# update function
function update {
    sudo apt update
}

# upgrade function 
function upgrade {
    sudo apt upgrade
}

# pause function
function pause {
    read -n1 -p 'Press Space (any) key when ready'
}

# kill tmux sessions
function tmuxkill {
    tmux kill -session -a -t vimsession
}

# vimsession
function vimsession {
    tmux a -t vimsession
}



# git add function
function gitadd {
    echo 'Showing the Git Status';
    echo '';
    git status;
    pause;
    echo '';
    echo 'Showing the last 2 Git commit messages';
    echo '';
    git log --oneline -2;
    echo '';
    read -p "Enter your Commit message: " message;
    git add .;
    git commit -m "$message";
    echo 'Files uploaded to local repository'
}

# git push function 
function gitpush {
    if git push origin master
    then 
         echo ' Files Uploaded to Github Sucessful'
    else
        echo 'Unable to upload files to Github'
    fi
}



# git pull function 
function gitpull {
    if git push origin master
    then
        echo 'Files were Fetched and Merged'
    else 
        echo 'Unable to Fetch and Merge Files'
    fi
}

# history sync function
function synchistory {
    history -a;
    history -n;
}

synchistory






