# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#export PS1='\[\033[00;36m\]\w\[\033[0;33m\] $\[\033[0m\] '

# These settings are necessary for the CONBOL project
#export CONBOL_HOME=/home/o.gorban/ctf-test/conbol
#export LD_LIBRARY_PATH=$CONBOL_HOME/lib:$CONBOL_HOME/lib/linux26x86:$CONBOL_HOME/lib/linux26x86_64
#export PATH=$PATH:/usr/lib32:/usr/lib:$CONBOL_HOME/bin:$CONBOL_HOME/llvm_scripts:/usr/include

alias mg='conbol_llvm_makegen -f --symbolic-locals -A x86 --libc -p'
alias mgpp='conbol_llvm_makegen -f --symbolic-locals -A x86 --libc -p'
alias run='conbol_llvm_run -f --ignore-errors --silent --nonstop -t 60 -l 10'
alias rund='conbol_llvm_run -f --ignore-errors --nonstop -t 60 -l 10'

## #
## #   L E S S   C O L O R S   F O R   M A N   P A G E S
## #
## 
## # CHANGE FIRST NUMBER PAIR FOR COMMAND AND FLAG COLOR
## # currently 0;33 a.k.a. brown, which is dark yellow for me 
##    export LESS_TERMCAP_md=$'\E[0;33;5;74m'  # begin bold
## 
## # CHANGE FIRST NUMBER PAIR FOR PARAMETER COLOR
## # currently 0;36 a.k.a. cyan
##    export LESS_TERMCAP_us=$'\E[0;36;5;146m' # begin underline
## 
## # don't change anything here
##    export LESS_TERMCAP_mb=$'\E[1;31m'       # begin blinking
##    export LESS_TERMCAP_me=$'\E[0m'           # end mode
##    export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
##    export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
##    export LESS_TERMCAP_ue=$'\E[0m'           # end underline
## 
## #########################################
## # Colorcodes:
## # Black       0;30     Dark Gray     1;30
## # Red         0;31     Light Red     1;31
## # Green       0;32     Light Green   1;32
## # Brown       0;33     Yellow        1;33
## # Blue        0;34     Light Blue    1;34
## # Purple      0;35     Light Purple  1;35
## # Cyan        0;36     Light Cyan    1;36
## # Light Gray  0;37     White         1;37
## #########################################


PS1='\[\033[00;36m\]\w\[\033[0;33m\] $\[\033[0m\] '

alias gs='git status '
alias gsl='gs | less -S'
alias go='git checkout'
alias gb='git branch'
alias ga='git add'
alias gaa='git add . && gs'
alias gc='git commit -m '
alias gf='git fetch'
alias gd='git diff --color '
alias gl='git log --pretty=format:"%h | %an | %ad | %s %d " --graph --date=short --date=local' # | less -S'
alias glf='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(cyan)<%an>%Creset" --abbrev-commit --date=relative --all '
alias glm='git log --author=o.gorban --pretty=format:"%Cred%h%Creset - %C(cyan)%cd%Creset %Cgreen%s" --date=short | less -S'
alias glh='git log --graph --color'
alias gla='git log --pretty=format:"%h | %an | %ad | %s %d " --graph --date=short --date=local --all | less -S'
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias stash='git stash '

alias mg='conbol_llvm_makegen -F std=gnu89 -f -l --instrOption initLocalVarAsSymbolic -A x86'
alias mgpp='conbol_llvm_makegen -f -l --instrOption initLocalVarAsSymbolic -A x86'
alias run='conbol_llvm_run -f 2>2.ll '
alias runwn='conbol_llvm_run -w -f -n 2>2.ll '
alias runnw='conbol_llvm_run -w -f -n 2>2.ll '
alias bad_report='conbol_report --select-segv --select-fail --enable-segv --enable-fail'

alias gdb='gdb -q '
alias aptitude='sudo aptitude'


# These settings are necessary for the CONBOL project
export CONBOL_HOME=/home/o.gorban/projects/ctf-test/conbol
export LD_LIBRARY_PATH=$CONBOL_HOME/lib:$CONBOL_HOME/lib/linux26x86:$CONBOL_HOME/lib/linux26x86_64
#export PATH=$PATH:/usr/lib32:/usr/lib:$CONBOL_HOME/bin:$CONBOL_HOME/llvm_scripts:/usr/include

## #######################################################################
## ## Setting for Svace
## #######################################################################
## if [ -z $OLD_PATH ]; then
##   export OLD_PATH=$PATH
## fi
## function set_svace()
## {
##   export SVACE_ROOT=/home/o.gorban/projects/svace-2.1.19-x64-linux
##   export SVACE_HOME=$SVACE_ROOT
##   #export SVACE_HOME=$SVACE_ROOT/svace-1.6.0.2-host-x64-CONBOL
##   export X86_COMPILER_BASE=compilers/clang-3.4-x86-linux
##   export X64_COMPILER_BASE=compilers/clang-3.4-x64-linux
##   export OLD_PATH=$PATH
##   export PATH=$SVACE_HOME/bin:$SVACE_HOME/$X64_COMPILER_BASE/bin:$OLD_PATH
##   #export PATH=$SVACE_HOME/bin:$SVACE_HOME/$X86_COMPILER_BASE/bin:$SVACE_HOME/$X64_COMPILER_BASE/bin:$SVACE_HOME/svace-1.6.0-src/compilers-building/tool-wrappers:$OLD_PATH
##   echo "Use SVACE at $SVACE_HOME" 
##   which svace
##   which clang
## }
## function unset_svace()
## {
##   if [ -n $OLD_PATH ]; then
##      export PATH=$OLD_PATH
##   fi
##   export SVACE_ROOT=
##   export SVACE_HOME=
##   export X86_COMPILER_BASE=
##   export X64_COMPILER_BASE=
##   export OLD_PATH=
##   echo "SVACE deactivated." 
##   which clang
## }
## #######################################################################

# svace config
export SVACE_HOME="/home/o.gorban/prj/svace-checkers-java-security/svace-release/svace-2.1.43-x64-linux"
export PATH=$SVACE_HOME/bin:$SVACE_HOME/$X86_COMPILER_BASE/bin:$SVACE_HOME/$X64_COMPILER_BASE:$PATH

export CDPATH=.:~

man() {
   env LESS_TERMCAP_mb=$'\E[01;31m' \
	   LESS_TERMCAP_md=$'\E[01;38;5;74m' \
	   LESS_TERMCAP_me=$'\E[0m' \
	   LESS_TERMCAP_se=$'\E[0m' \
	   LESS_TERMCAP_so=$'\E[38;5;246m' \
	   LESS_TERMCAP_ue=$'\E[0m' \
	   LESS_TERMCAP_us=$'\E[04;38;5;146m' \
	   man "$@"
}


