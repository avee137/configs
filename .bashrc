# Generic $dotdir/bashshrc
# Engineering Services (ES)
#
##
# Things the user might wish to set.
export USER_PATH="~/bin"			# Extra paths.
export EDITOR=vi				# Preferred editor.
export PRINTER=lp				# Preferred printer.
export NNTPSERVER=usenet.cisco.com		# Preferred news server.

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
#export PS1="\h:\w # "            # shell prompt format
########################################################
#txtblk='\e[0;30m' # Black - Regular
#txtred='\e[0;31m' # Red
#txtgrn='\e[0;32m' # Green
#txtylw='\e[0;33m' # Yellow
#txtblu='\e[0;34m' # Blue
#txtpur='\e[0;35m' # Purple
#txtcyn='\e[0;36m' # Cyan
#txtwht='\e[0;37m' # White
#bldblk='\e[1;30m' # Black - Bold
#bldred='\e[1;31m' # Red
#bldgrn='\e[1;32m' # Green
#bldylw='\e[1;33m' # Yellow
#bldblu='\e[1;34m' # Blue
#bldpur='\e[1;35m' # Purple
#bldcyn='\e[1;36m' # Cyan
#bldwht='\e[1;37m' # White
#unkblk='\e[4;30m' # Black - Underline
#undred='\e[4;31m' # Red
#undgrn='\e[4;32m' # Green
#undylw='\e[4;33m' # Yellow
#undblu='\e[4;34m' # Blue
#undpur='\e[4;35m' # Purple
#undcyn='\e[4;36m' # Cyan
#undwht='\e[4;37m' # White
#bakblk='\e[40m'   # Black - Background
#bakred='\e[41m'   # Red
#bakgrn='\e[42m'   # Green
#bakylw='\e[43m'   # Yellow
#bakblu='\e[44m'   # Blue
#bakpur='\e[45m'   # Purple
#bakcyn='\e[46m'   # Cyan
#bakwht='\e[47m'   # White
#txtrst='\e[0m'    # Text Reset
#######################################

export  PS1="\[\e[0;36m\][\e[0;36m\]\u@\[\e[32;1m\]\h:\[\e[0;36m\]\w]\\$\[\e[0m\] "
#PS1='\[\033[032m\]\u\[\033[01;34m\]@\[\033[01;33m\]\h \[\033[00;34m\][ \[\033[01;34m\]\w \[\033[00;34m\]]\[\033[01;32m\]$ \[\033[00m\]'
PS1='\[\033[032m\]\u\[\033[01;34m\]@\[\033[01;33m\]\h \[\033[00;34m\][ \[\033[01;34m\]\W \[\033[00;34m\]]\[\033[01;32m\]$ \[\033[00m\]'
##
# Source other rc files after this line.
[ -f ~/.bashrc_LOB ] && . ~/.bashrc_LOB
[ -f ~/.bashrc_BU ] && . ~/.bashrc_BU
[ -f ~/.bashrc_USER ] && . ~/.bashrc_USER

export PATH=/bin:/usr/bin:/sbin:/usr/sbin:/usr/cisco/bin:.:/usr/local/sbin:/usr/local/bin:/usr/bin/X11
source ~/.bash_aliases
alias ls='ls --color=never'
alias vi='vim'
alias vim='vim -X'
alias pycclean='find . -name "*.pyc" -exec rm -rf {} \;'
alias ns='cd /home/avkumar/coursework/fall17/netsec'
alias ai='cd /home/avkumar/coursework/fall17/ai'
alias as='cd /home/avkumar/coursework/fall17/async'
alias bcr='cd /home/avkumar/coursework/fall17/async/project/ByzantineChainReplication/'
alias cb='cd /home/avkumar/coursework/fall17/compbio'
alias spring='cd /home/avkumar/coursework/spring18'
alias 523='cd /home/avkumar/coursework/spring18/523/crawler/src/'
alias pb='cd /home/avkumar/coursework/interview/problems/'
alias ws='cd /home/avkumar/workspace/'
#distAlgo
#alias python='python3'
#export PYTHONPATH=/home/avkumar/coursework/fall17/async/project/pyDistAlgo-1.0.9/
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

#disable ctrl s on terminal
stty -ixon

#Android
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools

#OS lab cs506
alias sos='sshpass -p Whathefk1! ssh -p 130 -t root@vl55.cs.stonybrook.edu "cd /usr/src/hw3-cse506g05/ ; bash"'
#press 'Enter''~''.' to close frozen connections

# added by Miniconda2 installer
#export PATH="/home/avkumar/miniconda2/bin:$PATH"
