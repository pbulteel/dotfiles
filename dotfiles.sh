#!/usr/bin/env bash
# 
# Author: Patrick Bulteel
# Description:  This script copies all the .bash* and relevant files over.
#               To simplify the copy, I've put the filenames in a bash brace
#               expansion list. Unfortunately, due to the order of expansions,
#               brace expansion happens before variable expansion, so I can't 
#               make the list a variable. 
#

COMMAND=$1

set -euo pipefail
IFS=$'\n\t'

### COLOR ### (https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)
NC='\033[0m' # No Color
# Bold
BRED='\033[1;31m'    # Red
BPURPLE='\033[1;35m' # Purple
BYELLOW='\033[1;33m' # Yellow
BCYAN='\033[1;36m'   # Cyan

cat << 'EOF'
      .--.
     |o_o |  HI :)
     |:_/ |
    //   \ \
   (|     | )
  /'\_   _/`\
  \___)=(___/
EOF

if [[ ! -f .bashrc ]] ; then echo -e "${BRED}Please run it in the dotfiles git directory." ; fi

case "${COMMAND}" in
  'restore')
    echo -e "${BRED}Copying files over...${NC}"
    cp ./{.bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.functions,.vimrc} \
    "${HOME}"/.
    touch "${HOME}/.extra"
    # git cli completion needs this.
    echo -e "${BRED}Downloading git-completion...${NC}"
    curl -sS -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash > ~/.git-completion.bash

    ;;
  'backup')
    echo -e "${BPURPLE}Backing up files into ${BCYAN}git repo...${NC}"
    cp "${HOME}"/{.bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.functions,.vimrc} \
        /.
    ;;
  *)
    echo -e "${BYELLOW}$0: invalid option -- ${BRED}\"${COMMAND}\"${NC}"
    echo "Usage: $0 <command>"
    echo "  backup         Copies the files from \$HOME to your git repo"
    echo "  restore        Copies the files from your git repo into \$HOME"
    echo ""
    ;;
esac