alias nave=~/Projects/nave/nave.sh
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

DIM=$(tput dim)
RED=$(tput setaf 1)
GRN=$(tput setaf 2)
BLU=$(tput setaf 3)
MAG=$(tput setaf 5)
CLR=$(tput sgr0)
GRY="\033[0;90m"

function git_prompt {
  git status >/dev/null 2>&1 || return;
  [[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] &&
  echo -en ${RED} || echo -en ${GRN}
  echo -n $(git branch 2>/dev/null | grep \* | sed 's/..//')
  echo -en "${GRY} • "
}

function last {
  last=$?
  if [[ $last -ne 0 ]]; then
    echo -n "🔴  "
  fi
}

PS1="\[${GRY}\$(last)\u • \$(node -v) • ${CLR}\$(git_prompt)${GRY}\$(pwd)\]\n\[${CLR}\][\!]\$ "

export EDITOR="/usr/bin/vim"
export VISUAL="/usr/local/bin/mate --wait"

export MANTA_KEY_ID='59:3a:0e:b2:ab:6f:1a:b3:e2:f8:f2:17:92:71:bf:33'
export MANTA_USER='newrelic_qa'
export MANTA_URL='https://us-east.manta.joyent.com'
