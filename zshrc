# 'Borrowed' from http://jeff.robbins.ws/reference/my-zshrc-file

# Color table from: http://www.understudy.net/custom.html
fg_black=%{$'\e[0;30m'%}
fg_red=%{$'\e[0;31m'%}
fg_green=%{$'\e[0;32m'%}
fg_brown=%{$'\e[0;33m'%}
fg_blue=%{$'\e[0;34m'%}
fg_purple=%{$'\e[0;35m'%}
fg_cyan=%{$'\e[0;36m'%}
fg_lgray=%{$'\e[0;37m'%}
fg_dgray=%{$'\e[1;30m'%}
fg_lred=%{$'\e[1;31m'%}
fg_lgreen=%{$'\e[1;32m'%}
fg_yellow=%{$'\e[1;33m'%}
fg_lblue=%{$'\e[1;34m'%}
fg_pink=%{$'\e[1;35m'%}
fg_lcyan=%{$'\e[1;36m'%}
fg_white=%{$'\e[1;37m'%}
# Text Background Colors
bg_red=%{$'\e[0;41m'%}
bg_green=%{$'\e[0;42m'%}
bg_brown=%{$'\e[0;43m'%}
bg_blue=%{$'\e[0;44m'%}
bg_purple=%{$'\e[0;45m'%}
bg_cyan=%{$'\e[0;46m'%}
bg_gray=%{$'\e[0;47m'%}
# Attributes
at_normal=%{$'\e[0m'%}
at_bold=%{$'\e[1m'%}
at_italics=%{$'\e[3m'%}
at_underl=%{$'\e[4m'%}
at_blink=%{$'\e[5m'%}
at_outline=%{$'\e[6m'%}
at_reverse=%{$'\e[7m'%}
at_nondisp=%{$'\e[8m'%}
at_strike=%{$'\e[9m'%}
at_boldoff=%{$'\e[22m'%}
at_italicsoff=%{$'\e[23m'%}
at_underloff=%{$'\e[24m'%}
at_blinkoff=%{$'\e[25m'%}
at_reverseoff=%{$'\e[27m'%}
at_strikeoff=%{$'\e[29m'%}

#PROMPT="
#${fg_lgreen}%n@${at_underl}%m${at_underloff}${fg_white}[${fg_cyan}%~${fg_white}]
#[${fg_green}%T${fg_white}]:${at_normal}"
PROMPT="
${fg_blue}%n@%m: ${at_reverse}[ %~ ]${at_reverseoff}${fg_white}
[${fg_red}%T${fg_white}]: ${at_normal}"

# Set the auto completion on
autoload -U compinit
compinit

# Set some options
setopt correctall
setopt autocd
setopt auto_resume

# Enable the extgended globbing features
setopt extendedglob

# Set some ZSH styles
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'

HISTFILE=~/.zsh-histfile
HISTSIZE=1000
SAVEHIST=1000

# Aliases
# ls, the common ones
alias ls='ls -F'      #add the indicators
alias lh='ls -lh'     #size,show type,human readable

# cd, because typing the backslash is ALOT of work!!
alias .='cd ../'
alias ..='cd ../../'
alias ...='cd ../../../'
alias ....='cd ../../../../'

bindkey -v

# Somehow the OSX defaults got nuked - add those colours back
CLICOLOR=1
LSCOLORS=exfxcxdxbxegedabagacad
export CLICOLOR LSCOLORS

# Stuff from my old bash_profile
alias uw='scp -C -q -r /Users/marc/Documents/workspace/jboss-5.1.0.GA/server/default/deploy/signiant.war/* root@mgr2:/usr/signiant/dds/3rdparty/jboss/server/default/deploy/signiant.war'
alias uj='scp -C -q /Users/marc/Documents/workspace/manager_jar/dist/signiant.jar root@mgr2:/usr/signiant/dds/3rdparty/jboss/server/default/deploy/'
alias uc='scp -C -q /Users/marc/Documents/workspace/customizer/dist/signiant_customizer.war root@mgr2:/usr/signiant/dds/3rdparty/jboss/server/default/deploy/'
alias bounce='ssh root@mgr2 /usr/signiant/dds/init/siginit restart sigjboss'
alias uab='uc;uw;uj;bounce'

# Make VIM start-up correctly
alias m='mvim --remote-silent'
alias vim='mvim -v'
alias vi='mvim -v'

export PATH=/usr/local/bin:/usr/local/sbin:/sbin:/opt/subversion/bin:$PATH

"$HOME/.rvm/scripts/rvm" # Load RVM function