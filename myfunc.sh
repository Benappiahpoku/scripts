#!/bin/bash

# SET OF CUSTOM FUNCTIONS #

#***                                                             ***#
                        #Function List
# 1.shut 2.restart 3.update 4.upgrade 5.pause 6.tmuxkill 7.vimsession
# 8.gitadd 9.gitpush 10.gitpull 11.synchistory 12.serve 13.watchtask
# 14.get(install apps) 15.  

#***                                                             ***#


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
    echo '***Showing the Git Status***';
    echo '';
    git status;
    pause;
    echo '';
    echo '***Showing the last 3 Git commit messages***';
    echo '';
    git log --oneline -3;
    echo '';
    read -p "Enter your Commit message: " message;
    git add .;
    git commit -m "$message";
    echo ''
    echo '***Files uploaded to local repository***'
    echo ''
}

# git push function 
function gitpush {
    if git push origin master
    then 
        echo '' 
        echo '***Files Uploaded to Github Successfully***'
        echo ''
    else
        echo ''
        echo '***Unable to upload files to Github***'
        echo ''
    fi
}

# git pull function 
function gitpull {
    if git push origin master
    then
        echo ''
        echo '***Files were Fetched and Merged***'
        echo ''
    else 
        echo ''
        echo '***Unable to Fetch and Merge Files***'
        echo ''
    fi
}

# history sync function
function synchistory {
    history -a;
    history -n;
}

synchistory

# serve function 
function serve {

# Message to start process
    echo ''
    echo 'Your changes are ready for the web browser'

# watch the index and serve files
    browser-sync start --server --files .
}

# watchtask function
function watchtask {

# Message to start process
    echo ''
    echo 'We have started watching your files! Go ahead and make changes'
    echo ''

# watch the assets/scss compile css to dist/css

    onchange 'assets/scss/*.scss' -- node-sass --output-style expanded --source-map=true  -o dist/css assets/scss  &

# watch the image directory and send to dist/img

    onchange 'assets/img/*' -- imagemin assets/img/* --out-dir dist/img

}


# get function > install apps
function get {
    sudo apt install -y "$1";
    
}





