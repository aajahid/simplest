Color_Off='\e[0m' 

  RED="\033[1;31m"
  BBlack='\e[1;30m'
  YELLOW="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[0;37m"
  BOLD=""
  RESET="\033[m"


  # High Intensity
IBlack='\e[0;90m'       # Black
IRed='\e[0;91m'         # Red
IGreen='\e[0;92m'       # Green
IYellow='\e[0;93m'      # Yellow
IBlue='\e[0;94m'        # Blue
IPurple='\e[0;95m'      # Purple
ICyan='\e[0;96m'        # Cyan
IWhite='\e[0;97m'       # White








function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/(\1$(parse_git_dirty))/"
}
 
PS1="📂  \[$RED\]\W \[$Color_Off\]\[$IBlack\]\$(parse_git_branch)\[$WHITE\] \[$RESET\]"
