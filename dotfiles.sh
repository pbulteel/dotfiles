#!/usr/bin/env bash
# 
# Author: Patrick Bulteel
# Description: This script copies all the .bash* and relevant files over.
#

ARG=$1
FILELIST=".bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.extra,.functions"

case $ARG in
  'restore')
    echo 'Copying files over...'
    cp ./{${FILELIST}} $HOME/.
    ;;
  'backup')
    echo 'Backing up files into git repo...'
    cp ${HOME}/.bashrc ${HOME}/.aliases ${HOME}/.bash_profile ${HOME}/.bash_prompt \
        ${HOME}/.bash-preexec.sh ${HOME}/.extra ${HOME}/.functions \
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