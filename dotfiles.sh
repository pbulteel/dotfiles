#!/usr/bin/env bash
# 
# Author: Patrick Bulteel
# Description:  This script copies all the .bash* and relevant files over.
#               To simplify the copy, I've put the filenames in a bash brace
#               expansion list. Unfortunately, due to the order of expansions,
#               brace expansion happens before variable expansion, so I can't 
#               make the list a variable. 
#

ARG=$1

case $ARG in
  'restore')
    echo 'Copying files over...'
    cp ./{.bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.extra,.functions} \
    $HOME/.
    ;;
  'backup')
    echo 'Backing up files into git repo...'
    cp ${HOME}/{.bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.extra,.functions} \
        /.
    ;;
  *)
    echo '$0: invalid option -- "${ARG}"'
    echo 'Usage: $0 <command>'
    echo '  backup         Copies the files from $HOME to your git repo'
    echo '  restore        Copies the files from your git repo into $HOME'
    echo ''
    ;;
esac