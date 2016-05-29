## LANG
export LANG=ja_JP.UTF-8

## ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad

## PATH
# homebrew
export PATH=/usr/local/bin:$PATH
# homebrew cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
# texlive
export PATH=/usr/local/texlive/2014/bin/x86_64-darwin:$PATH

# editor
export EDITOR=/usr/local/bin/vim

#key bind
bindkey -e

## COMPINIT
autoload -U compinit
compinit
HISTFILE=~/.zsh_history
HISTSIZE=6000000
SAVEHIST=6000000
setopt hist_ignore_dups     # ignore duplication command history list
setopt share_history        # share command history data
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

## PROMPT
case ${UID} in
0)
    PROMPT="%B%{[32m%}[%n@%m]$ %{[m%}%b"
    RPEOMPT="%B%{[32m%}[%~] %{m%}%b"
    setopt transient_rprompt
    ;;

*)
    PROMPT="%{[32m%}[%n@%m]$ %{[m%}"
    RPROMPT="%{[32m%}[%~] %{[m%}"
    setopt transient_rprompt
    ;;
esac

## ALIAS
# ls
case "${OSTYPE}" in
darwin*)
    alias ls="ls -G"
    alias lt="ls -ltG"
    alias la="ls -aG"
    ;;
linux*)
    alias ls='ls --color'
    alias lt='ls -l --color'
    alias la='ls -a --color'
    ;;
esac

## Pyenv
# Opencvble shims and autocompletion add to your profile:

PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
fi

# To use Homebrew's directories rather than ~/.pyenv add to your profile:
#export PYENV_ROOT=/usr/local/opt/pyenv

# export PKG_CONFIG_PATH=$PKG_COFIG_PATH:$HOME/opencv/lib/pkgconfig
# exporrt LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/opencv/lib
#

## cron
#alias crontab -e="export EDITOR=/usr/local/bin/vim; crontab -e"

## g++
alias g++="g++ -std=c++11"

##vi
alias vi="vim -u NONE --noplugin"

## Virtualbox
alias runlistVM="VBoxManage list runningvms"
# quartus web
alias startVM_Cent7="VBoxManage startvm "Cent7" --type headless"
alias stopVM_Cent7="VBoxManage controlvm Cent7 poweroff"

# design compiler virtuso Encounter vcs
alias startVM_CUBE="VBoxManage startvm "CentCube6.6" --type headless"
alias stopVM_CUBE="VBoxManage controlvm CentCube6.6 poweroff"
