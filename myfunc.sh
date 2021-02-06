#!/bin/bash

# SET OF CUSTOM FUNCTIONS #

#***                                                             ***#
                        #Function List
# 1. shut 2. restart 3. update 4. upgrade 5. pause 6. tmuxkill 7. vimsession
# 8. gitadd 9. gitpush 10. gitpull 11. synchistory 12. serve 13. watchtask
# 14. build  15. imgcopy 16. get(install apps) 17. mkfile(creating new files) 
# 18. onedrive 19. upgradelist 20. reload (bash) 21. gitpushmain 
# 22. gitpullmain 23.  laravel (new project) 24. phpserve (laravel server start) 25. npmserve (laravel browser sync) 26. updateall

#***                                                             ***#


#1 shutdown function
function shut {
   shutdown now;  
}

#2 restart function 
function restart {
    shutdown -r now;
}

#3 update function
function update {
    sudo apt update
}

#4 upgrade function 
function upgrade {
    sudo apt -y upgrade
}


#5 pause function
function pause {
    read -n1 -p 'Press Enter to continue ...'
}

#6 kill tmux sessions
function tmuxkill {
    tmux kill -session -a -t vimsession
}

#7 vimsession
function vimsession {
    tmux a -t vimsession
}

#8 git add function
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

#9 git push function 
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

#10 git pull function 
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

#11 history sync function
function synchistory {
    history -a;
    history -n;
}

synchistory # the funtion is called automatically on boot 

#12 serve function 
function serve {

# Message to start process
    echo ''
    echo 'Your changes are ready for the web browser'

# watch the index and serve files
    browser-sync start --server --files .
}

#13 watchtask function
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

#14 Build - First time setup - sass, js and images function 

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


#15 Copy images from assets/img to dist/img folder

function imgcopy {

# Message to start process
    echo ''
    echo 'Moving image files from assets/img to dist/img'

cp assets/img/*  dist/img/;

}

#16 get function > install apps
function get {
    sudo apt install -y "$@" ;
    
}

#17 mkfile function > mkfile new files
function mkfile {
    touch "$@"
}

#18 onedrive function 
function onedrive {
    cd ~/bin/onedrive;
    nohup ./onedrive &
    exit
}
#19 upgradelist

function upgradelist {
	apt list --upgradable;
}

#20 Reload Bash
function reload {
    source ~/.bashrc
}

#21 git push main function 
function gitpushmain {
    if git push origin main
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

#22. git pull main function 
function gitpullmain {
    if git pull origin main
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

#23.  Creating new laravel project with composer
function laravel {
	composer create-project --prefer-dist laravel/laravel "$@" ;
}

#24.  Running laravel server
function phpserve {
	php artisan serve;
}


#25.  Running Browser sync in laravel 
function npmserve {
	npm run watch;
}

#26 update & upgrade function
function updateall {
     update && upgrade;
}







