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

cat << 'EOF'
      .--.
     |o_o |  HI :)
     |:_/ |
    //   \ \
   (|     | )
  /'\_   _/`\
  \___)=(___/
EOF


### COLOR ### (https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux)
NC='\033[0m' # No Color
# Bold
BRED='\033[1;31m'    # Red
BPURPLE='\033[1;35m' # Purple
BYELLOW='\033[1;33m' # Yellow
BCyan='\033[1;36m'   # Cyan

case "${COMMAND}" in
  'restore')
    echo -e '${BRED}Copying files over...${NC}'
    echo cp ./{.bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.extra,.functions} \
    "${HOME}"/.
    ;;
  'backup')
    echo -e 'Backing up files into git repo...'
    echo cp "${HOME}"/{.bashrc,.aliases,.bash_profile,.bash_prompt,.bash-preexec.sh,.extra,.functions} \
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