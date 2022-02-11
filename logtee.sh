#!/bin/bash
##
## Visit https://github.com/alkorang/logtee for license and more.
##
## `logtee.sh` uses `tee` command to redirect all stdout, stderr
## to the terminal and a log file.
## Put `source logtee.sh` or `. logtee.sh` to include this script.
##
## To override the log file path, set LOGTEEPATH env
##
## If LOGTEEPATH env is empty, `logtee.sh` uses the name same as the running
## bash script with `.log` extension, e.g., `run.log` for `run`, `run.sh`
##
if [ -z "${LOGTEEPATH}" ]
then
    ## __RUNNAME= name of the bash script file 
    readonly __RUNNAME="$(basename "${0}")"
    ## __LOGNAME = log file name
    readonly __LOGNAME="${__RUNNAME%.*}.log"
    ## __LOGPATH = absolute log file path
    readonly __LOGPATH="$(realpath "${__LOGNAME}")"
else
    readonly __LOGPATH="${LOGTEEPATH}"
fi
## If the user has no write permission on __LOGPATH, exit immediately
touch "${__LOGPATH}" || exit "${?}"
## Redirect stdout/stderr to the log file 
exec &> >(tee -a "${__LOGPATH}")

## Done, print date and __LOGPATH
echo ""
date
echo "logtee output: ${__LOGPATH}"
echo ""

