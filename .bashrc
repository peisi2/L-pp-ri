# Sample .bashrc for SuSE Linux
# Copyright (c) SuSE GmbH Nuernberg

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

# Some applications read the EDITOR variable to determine your favourite text
# editor. So uncomment the line below and enter the editor of your choice :-)
export EDITOR=/usr/bin/vim
#export EDITOR=/usr/bin/mcedit

# For some news readers it makes sense to specify the NEWSSERVER variable here
#export NEWSSERVER=your.news.server

# If you want to use a Palm device with Linux, uncomment the two lines below.
# For some (older) Palm Pilots, you might need to set a lower baud rate
# e.g. 57600 or 38400; lowest is 9600 (very slow!)
#
#export PILOTPORT=/dev/pilot
#export PILOTRATE=115200

test -s ~/.alias && . ~/.alias || true
if [ -f `which powerline-daemon` ]; then
  powerline-daemon -q
  POWERLINE_BASH_CONTINUATION=1
  POWERLINE_BASH_SELECT=1
  . /usr/share/powerline/bash/powerline.sh
fi

export GPG_TTY=$(tty)
export TERM=xterm-256color
export COLORTERM=truecolor
#PS1="\u@ \[\e[32;1m\][\A]\[\e[0m\]\[\e[34;1m\]\W\[\e[0m\] $ "
#PS1="\u@ \[\e[31;1m\][\A]\[\e[0m\]\[\e[44;1m\]\w\[\e[0m\] $ "

## FUNKTIOT

function RPC () {
url=http://rautaportti.net/announce.php
for i in "$@"; do
        transmission-create -p -t $url -o "$i.torrent" "$i"
done
}

function kopio () {
scp "$@" mika@192.168.0.112:~/
}

function InOut () {
Grep="ifconfig enp3s0 | egrep -w 'RX|TX'"
watch -n1 $Grep
}

function TO () {
#LOPPUOSA=[.avi,.mp4,.mkv^]
LOPPUOSA=[.avi|.mp4|.mkv]
totem *$LOPPUOSA
}
function SYS () {
AIKA=$(date '+%j-%B')
sys_info -f ~/Hiekkis/fedora_$AIKA
}
function nof () {
        ls -l $1 | egrep -c '^-'
}


