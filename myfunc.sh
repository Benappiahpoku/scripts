#!/bin/bash

# SET OF CUSTOM FUNCTIONS #

#***                                                             ***#
                        #Function List
# 1.shut 2.restart 3.update 4.upgrade 5.pause 6.tmuxkill 7.vimsession
# 8.gitadd 9.gitpush 10.gitpull 11.synchistory 12.serve 13.watchtask
# 14.get(install apps) 15.mkfile(creating new files) 16.onedrive 
# 17.build  18.imgcopy

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
    sudo apt -y upgrade
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
    if git pull origin master
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

synchistory # the funtion is called automatically on boot 

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
    echo 'We have started watching your Sass and Image folders! Go ahead and make changes'
    echo ''

# watch the assets/scss compile css to dist/css

    onchange 'assets/scss/*.scss' -- node-sass --output-style expanded --source-map=true  -o dist/css assets/scss  &

# watch the assests img then on change, minify image and send to dist/img
 onchange 'assets/img/*' -- echo 'You have to run imgcopy function to move images from assets to dist folder'


# watch the assests img then on change, minify image and send to dist/img
# onchange 'assets/img/*' -- imagemin assets/img/* --out-dir dist/img

}

# Build - First time setup - sass, js and images function 

function build {


# Message to start process
    echo ''
    echo 'Compiling your style.scss to style.css in assets'

# Compile Sass to style.css into Assets folder

node-sass --output-style expanded --source-map=true  -o assets/css assets/scss; 


# Message to start process
    echo ''
    echo 'Moving Javascript,img files and Style.css to dist folder'


# Move Javascript, Css and img files to dist folder

cp assets/js/*.min.js  dist/js/;
cp assets/css/*  dist/css/;
cp assets/img/*  dist/img/;

}


# Copy images from assets/img to dist/img folder

function imgcopy {

# Message to start process
    echo ''
    echo 'Moving image files from assets/img to dist/img'

cp assets/img/*  dist/img/;

}

# get function > install apps
function get {
    sudo apt install -y "$@" ;
    
}

# mkfile function > mkfile new files
function mkfile {
    touch "$@"
}

#onedrive function 
function onedrive {
    cd ~/bin/onedrive;
    nohup ./onedrive &
    exit
}



