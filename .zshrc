## LANG
export LANG=ja_JP.UTF-8

### ls colors
export LSCOLORS=gxfxcxdxbxegedabagacad



## PROMPT
case ${UID} in 
    0)
        PROMPT="%B%{[32m%}[%n@%m]$ %{[m%}%b"
        RPEOMPT="%B%{[32m%}[%~] %{[m%}%b"
        setopt transient_rprompt
        ;;
    *)
        PROMPT="%B%{[32m%}[%n@%m]$ %{[m%}%b"
        RPROMPT="%B%{[32m%}[%~] %{[m%}%b"
        setopt transient_rprompt
        ;;
esac


## LANG
export LANG=ja_JP.UTF-8

##key bind
bindkey -e

## tmux
export TMUX_TMPDIR=/var/run/tmux

## Python
PYTHON_VERSION=Anaconda3
#export PATH=/cygdrive/c/Users/kirIn-win/$PYTHON_VERSION/:/cygdrive/c/Users/kirIn-win/$PYTHON_VERSION/Scripts/:$PATH
export PATH=/cygdrive/c/Users/kirIn-win/$PYTHON_VERSION:$PATH

## xilinx
# alias vivado='/cygdrive/c/Xilinx/Vivado/2015.4/bin/vivado.bat'
export PATH=/cygdrive/c/Xilinx/Vivado/2015.4/bin:$PATH

## altera
QUARTUS_VERSION=16.0
export PATH=/cygdrive/c/altera_lite/$QUARTUS_VERSION/quartus/bin64:$PATH

# altera soc
export PATH=/cygdrive/c/altera_lite/$QUARTUS_VERSION/embedded/:$PATH

## modelsim
export PATH=/cygdrive/c/altera/15.1/modelsim_ase/win32aloem:$PATH

## Systemc
export CXX=g++
export SYSTEMC_HOME=/usr/local/systemc-2.3.1

## Tex Live
export PATH=/cygdrive/c/texlive/2016/bin/win32/:$PATH

# .sty /cygdrive/c/texlive/texmf-local/tex/platex/misc/mediabb.sty & mktexlsr

## pandoc
export PATH=/cygdrive/c/Users/kirIn-win/AppData/Local/Pandoc/:$PATH

####### alias

## ls
alias ls='ls --color'
alias lt='ls -l --color'
alias la='ls -a --color'

## paste & copy
alias pbcopy='cat > /dev/clipboard'
alias pbpaste='cat /dev/clipboard'

## tree
alias tree='tree --charsetC'
