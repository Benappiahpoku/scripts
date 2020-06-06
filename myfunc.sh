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
    read -n1 -p 'Press Enter to continue ...'
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
    git log --oneline -3;
    echo '';
    read -p "Enter your Commit message: " message;
    git add .;
    git commit -m "$message";
    echo ''
    echo 'Files uploaded to local repository'
    echo ''
}

# git push function 
function gitpush {
    if git push origin master
    then 
        echo '' 
        echo 'Files Uploaded to Github Successfully'
        echo ''
    else
        echo ''
        echo 'Unable to upload files to Github'
        echo ''
    fi
}



# git pull function 
function gitpull {
    if git push origin master
    then
        echo ''
        echo 'Files were Fetched and Merged'
        echo ''
    else 
        echo ''
        echo 'Unable to Fetch and Merge Files'
        echo ''
    fi
}

# history sync function
function synchistory {
    history -a;
    history -n;
}

synchistory






