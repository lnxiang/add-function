#!/bin/bash
script_dir=$(dirname `readlink -f $0`)
dist_bin_dir=$script_dir/dist/x64/bin

RELEASE_BUILD=0
REBUILD=1
MAKE_PACKAGE=0

SRC_BUILD=1

while getopts "crhapnuey" opt
do
    case $opt in

        c|cross)
            CROSS_BUILD=1
            ;;

        r|release)
            RELEASE_BUILD=1
            ;;

        a|append)
            REBUILD=0
            ;;

        h|help)
            usage
            exit 0
            ;;

        p|package)
            PACKAGE_BUILD=1
            ;;

        n|nobuild)
            SRC_BUILD=0
            ;;

        e|executeut)
            UT_RUN=1
            ;;

        u|ut)
            UT_BUILD=1
            ;;

        y|pybind)
            PYBIND_BUILD=1
            ;;

        \?)
            usage
            exit 1
            ;;

    esac    # --- end of case ---
done

if [ $SRC_BUILD -eq 1 ]; then
    
    if [ ! -d $dist_bin_dir ]; then
        mkdir -p $dist_bin_dir 
    fi
    
    mkdir -p $script_dir/build
    cd $script_dir/build
    cmake ..
    make -j$[`lscpu | grep "^CPU(s):" | awk '{print $2}'`]
fi

cd $script_dir/build
if [[ $PACKAGE_BUILD -eq 1 ]]; then
    cd $script_dir/build
    make package
fi

