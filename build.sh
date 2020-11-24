#!/bin/bash

# functions for the sass compile and image minify

function compile {
   node-sass --output-style expanded --source-map=true  -o assets/css assets/scss 
}


function imageTask {
    imagemin assets/img/* --out-dir dist/img
}


function move-js-css {
    cp assets/js/*.min.js  dist/js/
    cp assets/css/*  dist/css/
  
}


# call the functions
compile
imageTask
move-js-css
