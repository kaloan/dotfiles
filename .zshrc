# Use powerline
USE_POWERLINE="true"
# Source manjaro-zsh-configuration
if [[ -e /usr/share/zsh/manjaro-zsh-config ]]; then
  source /usr/share/zsh/manjaro-zsh-config
fi
# Use manjaro zsh prompt
if [[ -e /usr/share/zsh/manjaro-zsh-prompt ]]; then
  source /usr/share/zsh/manjaro-zsh-prompt
fi
source /usr/share/nvm/init-nvm.sh

# Make history worthwhile
if [[ ! -f $HOME/.config/zsh/.zsh_history ]]; then
  touch $HOME/.config/zsh/.zsh_history 
fi
export HISTFILE="$HOME/.config/zsh/.zsh_history" 
export HISTSIZE=2000
export SAVEHIST=2000
setopt EXTENDED_HISTORY

# Make ranger exit at its current directory
if [[ ! -f $HOME/.config/ranger/.rangerdir ]]; then
  touch $HOME/.config/ranger/.rangerdir
fi
alias ranger='ranger --choosedir=$HOME/.config/ranger/.rangerdir; LASTDIR=`cat $HOME/.config/ranger/.rangerdir`; cd "$LASTDIR"'
alias ls='ls --color=auto'
alias grep='grep --colour=auto'
alias egrep='egrep --colour=auto'
alias fgrep='fgrep --colour=auto'
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano -w PKGBUILD'
alias more=less
#alias cp="cp -i"                          # confirm before overwriting something
