# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="simple"


# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
	brew
    fabric
	gem
	git
	github
	golang
	heroku
	pip
	python
	sublime
	tmux
	vagrant
	)

source $ZSH/oh-my-zsh.sh

# aliases
alias vi="vim"
# Follow symbolic links
alias cd="cd -P"
alias gl="git --no-pager log --oneline --decorate -n 10"
alias zshconfig="nano ~/.zshrc"
alias lsa="ls -alh"
alias airport="/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport"
alias sloc="find . -name '*.go' | xargs cat | awk '/[a-zA-Z0-9]/ {i++} END{print i}'"
alias rebuild-scss="cd $GOPATH/src/github.com/workwithgo/workwithgo && sass -t compressed scss/styles.scss static/css/styles.css"

# tmux
alias tmux="tmux -2 -u"
if which tmux 2>&1 >/dev/null; then
    test -z "$TMUX" && (tmux attach || tmux new-session)
fi

# PATH related settings

# Removes duplicate PATH entries but keeps the original order.
# https://github.com/gabebw/dotfiles/blob/master/zsh/path.zsh
trim_path() {
  # http://chunchung.blogspot.com/2007/11/remove-duplicate-paths-from-path-in.html
  export PATH=$(awk -F: '{for(i=1;i<=NF;i++){if(!($i in a)){a[$i];printf s$i;s=":"}}}'<<<$PATH)
}

env-update() { export PATH=$PATH; }

# man pages
MANPATH=/usr/share/man:/usr/local/share/man:/usr/X11/share/man:/usr/X11/man:/usr/local/man

# cd directly into these directories
cdpath=($HOME/Dropbox/code) 

# Homebrew
PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# Ansible
export ANSIBLE_CONFIG=$HOME/.ansible.cfg

# rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# node.js path
export NODE_PATH="/usr/local/lib/node"
export PATH="/usr/local/share/npm/bin:$PATH"

# Packer
export PATH="/usr/local/packer:$PATH"

# Bower
alias bower='noglob bower'

# Go 
export GOPATH=$HOME/.go
export GOBIN=$GOPATH/bin
export PATH=$GOBIN:$PATH:/usr/local/opt/go/libexec/bin
export GOROOT=/usr/local/opt/go/libexec
alias todo="godoc -notes="TODO" ."

# gb > go
alias gb=$GOPATH/bin/gb

# editor
export EDITOR='vim'

export PATH
trim_path


# added by travis gem
[ -f /Users/matt/.travis/travis.sh ] && source /Users/matt/.travis/travis.sh
