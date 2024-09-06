#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs..
source ~/.aliases
source ~/.oh-my-zsh/plugins/kubectl/kubectl.plugin.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source <(kubectl completion zsh)
source <(helm completion zsh | sed -E 's/\["(.+)"\]/\[\1\]/g')
#complete -o nospace -C /usr/local/bin/terraform terraform
fpath=(~/.myfunctions $fpath)

##minikube
#eval $(minikube docker-env)
export PATH=/Users/avkumar4/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
export PATH=$PATH:/usr/local/kubebuilder/bin
export PATH=$PATH:/Users/avkumar4/Downloads/installables/gradle-4.10.2/bin
export PATH=$PATH:/Users/avkumar4/.kubectl-plugins
export JAVA_HOME=$(/usr/libexec/java_home)


#history
setopt share_history
setopt inc_append_history

# dont correct cmds
setopt nocorrectall

#kube-ps1
source /usr/local/opt/kube-ps1/share/kube-ps1.sh
PROMPT='$(kube_ps1)'$PROMPT

export KUBE_EDITOR=vim 

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

#git fetch upstream and merge with master and update remote
gitup() {
    git fetch upstream
    git merge upstream/master
    git push
}
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH=$PATH:/Users/avkumar4/Downloads/installables/gradle-6.5.1/bin
plugins=(kubetail asdf)

export PATH=$PATH:$HOME/.asdf/shims

source /Users/avkumar4/.docker/init-zsh.sh || true # Added by Docker Desktop

# Load bash completion functions
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit

#GOLANG
export GO111MODULE=on


