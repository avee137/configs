# Generic $dotdir/bashshrc
# Engineering Services (ES)
#
##
# Things the user might wish to set.
export USER_PATH="~/bin"			# Extra paths.
export EDITOR=vi				# Preferred editor.
export PRINTER=lp				# Preferred printer.

##
# Should the full environment be set up even for non-interactive shells?
# Probably not but here is a variable to control it.
export FULLENV=false				# 'true' or 'false'

##
# Should all paths (even NFS, which might hang) be set up at login?
# The alias "fullpath" is available to setup your full path.  It can
# also be used to change your path by changing USER_PATH above.
export FULLPATH=true				# 'true' or 'false'

###########################################################################
# Everything above this line helps configure the environment.

# This line should not be removed.
dotdir=~/.files; [ -f $dotdir/sys_bashrc ] && . $dotdir/sys_bashrc
[ $FULLENV != "true" ] && [ -z "$PS!" ] && exit

###########################################################################
# Everything below this line is run for interactive shells.
# If you wish the full environment even in non-interactive
# shells set FULLENV above to 'true'.

umask 022                        # no write by group or other
export autologout=0              # disable autologout
export FIGNORE=".o"              # don't complete .o files
export HISTFILE=~/.bash_history  # history file
export HISTFILESIZE=500          # history file size
export HISTSIZE=128              # save last 128 commands
export HISTTIMEFORMAT="%h/%d - %H:%M:%S " #history time date display format
export ignoreeof=10              # disable ^D for logout (up to 10)
set -C                           # disable redirect overwrite
set -b                           # enable immediate job notify

export  PS1="\[\e[0;36m\][\e[0;36m\]\u@\[\e[32;1m\]\h:\[\e[0;36m\]\w]\\$\[\e[0m\] "
#PS1='\[\033[032m\]\u\[\033[01;34m\]@\[\033[01;33m\]\h \[\033[00;34m\][ \[\033[01;34m\]\w \[\033[00;34m\]]\[\033[01;32m\]$ \[\033[00m\]'
PS1='\[\033[032m\]\u\[\033[01;34m\]@\[\033[01;33m\]\h \[\033[00;34m\][ \[\033[01;34m\]\W \[\033[00;34m\]]\[\033[01;32m\]$ \[\033[00m\]'
##
export PATH=/bin:/usr/bin:/sbin:/usr/sbin:.:/usr/local/sbin:/usr/local/bin:/usr/bin/X11:/usr/games
source ~/.bash_aliases
alias ls='ls --color=never'
alias vi='vim'
alias vim='vim -X'
alias pycclean='find . -name "*.pyc" -exec rm -rf {} \;'
# function to set terminal title
function set-title(){
  if [[ -z "$ORIG" ]]; then
    ORIG="$PS1"
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1="${ORIG}${TITLE}"
}
#tmux
#new session
alias tmuxn='tmux new -s'
#attach existing
alias tmuxa='tmux a -t'
#list
alias tmuxl='tmux ls'
#kill
alias tmuxk='tmux kill-session -t'
# rename tab ~ , <new_name>
#ls color
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'
alias compile='./compile.sh'

#patch
alias putpch='patch -p1 <'

#disable ctrl s on terminal
stty -ixon

#Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools

#ssh
#press 'Enter''~''.' to close frozen connections
#git
alias gitlast='git rev-parse HEAD | xargs git show --name-only'
alias gitlast-full='git rev-parse HEAD | xargs git show'
#leetcode
alias lc='leetcode'
alias lch='echo "Read help first                         $ leetcode help
Login with your leetcode account        $ leetcode user -l
Browse all questions                    $ leetcode list
Choose one question                     $ leetcode show 1 -g -l cpp
Coding it!
Run test(s) and pray...                 $ leetcode test ./two-sum.cpp -t '[3,2,4]\n7'
Submit final solution!                  $ leetcode submit ./two-sum.cpp
"
'
