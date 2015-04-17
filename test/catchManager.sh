#!/bin/bash
# Formats Catch's output to create log files.

# -------------------------------------------------------------------
# Shows how to use the script.

function usage {
    ARGS="<e[1mtest executable\e[0m> <\e[1moutput file name\e[0m> [\e[1m-h\e[0m]\n"

    echo -e "\e[1mUSAGE\e[0m"
    echo -e "\t./`basename $0` $ARGS"

    echo -e "\e[1mDESCRIPTION\e[0m"
    echo -e "\tFormats Catch's output of the specified test, creating an output only"
    echo -e "\tif a failure is detected."

    echo -e "\e[1mOPTIONS\e[0m"
    echo -e "\tSeparate each option with a blank space.\n"

    echo -e "\t\e[1m-h\e[0m\tShows how to use the script, leaving it afterwards.\n"

    exit
}

# ===================================================================
# MAIN

# Checks for help argument
for arg in $@; do
    if [[ arg == "-h" ]]; then usage $0; fi
done

# Checks if there are enough arguments
if (( $# < 2 )); then usage $0; fi

# Execution
./$1 -o $2

if (( $? == 0 )); then
    rm -f $2
else
    cat $2
    echo -e "Failure saved in \033[1;31m$2\033[0m"
fi
