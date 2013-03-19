#########################
#! /bin/sh
#LC_ALL=C
#export LC_ALL
#export CC=gcc-4.2

test -r /sw/bin/init.sh && . /sw/bin/init.sh

alias uw='scp -C -q -r /Users/marc/Documents/workspace/jboss-5.1.0.GA/server/default/deploy/signiant.war/* root@mgr2:/usr/signiant/dds/3rdparty/jboss/server/default/deploy/signiant.war'
alias uj='scp -C -q /Users/marc/Documents/workspace/manager_jar/dist/signiant.jar root@mgr2:/usr/signiant/dds/3rdparty/jboss/server/default/deploy/'
alias uc='scp -C -q /Users/marc/Documents/workspace/customizer/dist/signiant_customizer.war root@mgr2:/usr/signiant/dds/3rdparty/jboss/server/default/deploy/'
alias bounce='ssh root@mgr2 /usr/signiant/dds/init/siginit restart sigjboss'
alias uab='uc;uw;uj;bounce'

alias m='mvim --remote-silent'
alias vim='mvim -v'
alias vi='mvim -v'

# Open finder window from current folder
alias f='open ./'

# Borrowed from Brett Terpstra http://brettterpstra.com/2013/03/14/more-command-line-handiness/
alias ql="qlmanage -p &>/dev/null"
alias psgrep="ps Ao pid,comm|ruby -e 'puts STDIN.read.gsub(/^ *(\d+) .*?([^\/]+?$)/,\"\\\1: \\\2\")'|grep -iE"

# ls archives (inspired by `extract`)
lsz() {
	if [ $# -ne 1 ]
	then
		echo "lsz filename.[tar,tgz,gz,zip,etc]"
		return 1
	fi
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2|*.tar.gz|*.tar|*.tbz2|*.tgz) tar tvf $1;;
			*.zip)  unzip -l $1;;
			*)      echo "'$1' unrecognized." ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

# Set 'vi' command editing mode
# How did I not know about this before?
set -o vi

export PATH=/usr/local/bin:/usr/local/sbin:/sbin:/opt/subversion/bin:$PATH

##
# Your previous /Users/marc/.bash_profile file was backed up as /Users/marc/.bash_profile.macports-saved_2011-03-17_at_11:55:11
##

# Add Tab-completion for SSH host aliases
#complete -o default -o nospace -W "$(/usr/bin/env ruby -ne 'puts $_.split(/[,s]+/)[1..-1].reject{|host| host.match(/*|?/)} if $_.match(/^s*Hosts+/);' < $HOME/.ssh/config)" scp sftp ssh
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

# Borrowed from Brett Terpstra
# cd to the path of the front Finder window
cdf() {
	target=`osascript -e 'tell application "Finder" to get POSIX path of (target of front Finder window as text)'`
	cd "$target"
}
