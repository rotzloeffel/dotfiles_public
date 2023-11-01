#--| $HOME/.bashrc |--#

# if not running interactively, don't do anything
[[ -n $PS1 ]] || return

#--| umask |--#

# read and write for the owner only.
# umask 002 # relaxed   -rwxrwxr-x
# umask 022 # cautious  -rwxr-xr-x
# umask 027 # uptight   -rwxr-x---
# umask 077 # paranoid  -rwx------
# umask 066 # bofh-like -rw-------
umask 066

# if root set umask to 022 to prevent new files being created group and world writable
if (( EUID == 0 )); then
    umask 022
fi

#--| general |--#

# cursor blink rate
echo -e '\e[16;550]'

# vi keys in shell
set -o vi

# disable ctrl-s ctrl-q in bash
stty -ixon

# load bash completion
[ -f /usr/share/bash-completion/bash_completion ] && \
    source /usr/share/bash-completion/bash_completion

# load dircolors
[ -f "$HOME/.dircolors" ] && eval "$(dircolors -b ~/.dircolors)"

# load aliases
if [ -f $XDG_CONFIG_HOME/shell/aliases ]; then
    . $XDG_CONFIG_HOME/shell/aliases
fi

# load functions
if [ -f $XDG_CONFIG_HOME/shell/functions ]; then
    . $XDG_CONFIG_HOME/shell/functions
fi

#--| directories |--#

# ssh sockets
[ -d "$HOME/.ssh/sockets" ] || \mkdir -p $HOME/.ssh/sockets && \chmod 700 $HOME/.ssh/sockets

# nano
[ -d "$HOME/backup/nano" ] || \mkdir -p $HOME/backup/nano/

# neomutt
[ -d "$XDG_CACHE_HOME/neomutt/bodies" ] || \mkdir -p $XDG_CACHE_HOME/neomutt/bodies

# ncmpcpp
[ -d "$XDG_CACHE_HOME/ncmpcpp/lyrics" ] || \mkdir -p $XDG_CACHE_HOME/ncmpcpp/lyrics
[ -d "$XDG_CACHE_HOME/ncmpcpp/previews" ] || \mkdir -p $XDG_CACHE_HOME/ncmpcpp/previews

# mpd
[ -d "$XDG_CACHE_HOME/mpd/playlists/" ] || \mkdir -p $XDG_CACHE_HOME/mpd/playlists/
[ -d "/var/run/user/$(id -u)/mpd/" ] || \mkdir -p /var/run/user/$(id -u)/mpd/

#--| path |--#

# add to $PATH if directory "$HOME/.local/bin" exists
   if [ -d "$HOME"/.local/bin ]; then
        case ":$PATH:" in
            *:$HOME/.local/bin:*) ;;
            *) PATH=$PATH:"$HOME"/.local/bin ;;
        esac
   fi

# add to $PATH if directory "$HOME/bin" exists
   if [ -d "$HOME"/bin ]; then
        case ":$PATH:" in
            *:$HOME/bin:*) ;;
            *) PATH=$PATH:"$HOME"/bin ;;
        esac
   fi

# add to $PATH if directory "$HOME/scripts" exists
   if [ -d "$HOME"/scripts ]; then
        case ":$PATH:" in
            *:$HOME/scripts:*) ;;
            *) PATH=$PATH:"$HOME"/scripts ;;
        esac
   fi

# add to $PATH if directory "/usr/local/go/bin" exists
   if [ -d /usr/local/go/bin ]; then
        case ":$PATH:" in
            *:/usr/local/go/bin:*) ;;
            *) PATH=$PATH:/usr/local/go/bin ;;
        esac
   fi

# add to $PATH if directory "/opt/Mullvad VPN" exists
   if [ -d "/opt/Mullvad VPN/" ]; then
        case ":$PATH:" in
            *:"/opt/Mullvad VPN":*) ;;
            *) PATH=$PATH:"/opt/Mullvad VPN" ;;
        esac
   fi

#--| ssh agent |--#

if [ $(ps ax | grep "[s]sh-agent" | wc -l) -eq 0 ] ; then
    eval $(ssh-agent -s) > /dev/null
    if [ "$(ssh-add -l)" = "The agent has no identities." ] ; then
        ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1
    fi
fi

#--| gpg-agent |--#

if (pgrep -u "${USER}" gpg-agent >/dev/null 2>&1); then
  export GPG_AGENT_PID=`pgrep -u ${USER} gpg-agent`
  export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:${GPG_AGENT_PID}:1
else
  eval `gpg-agent --daemon` > /dev/null
  export GPG_AGENT_PID=`pgrep -u ${USER} gpg-agent`
  export GPG_AGENT_INFO=${HOME}/.gnupg/S.gpg-agent:${GPG_AGENT_PID}:1
fi

#--| gnome-keyring |--#

if (pgrep -u "${USER}" gnome-keyring-dae >/dev/null 2>&1); then
  export GNOME_KEYRING_PID=`pgrep -u ${USER} gnome-keyring-dae`
  export GNOME_KEYRING_CONTROL=$XDG_CACHE_HOME/gnome-keyring
fi

#--| keybindings |--#

# useful commands = "bind -p", "bind-l", "bind -v"

# "ALT-v" -> edit commandline with $EDITOR

# bind "ALT+i" to fuzzy find process ids
bind -x '"\ei":"fzp"'

# bind "ALT+o" to fuzzy cd into project dirs
bind -x '"\eo":"fzproj"'

# bind "ALT+p" to fuzzy kill processes
bind -x '"\ep":"fzk"'

# bind "ALT+s" to fuzzy environment vars
bind -x '"\es":"fzv"'

# bind "ALT+m" to fuzzy find man pages
bind -x '"\em":"fzman"'

# bind "ALT+t" to fuzzy attach tmux sessions
bind -x '"\et":"fzta"'

# bind "ALT+g" to fuzzy show logfiles
bind -x '"\eg":"fzl"'

# bind "ALT+a" to fuzzy find aliases
bind -x '"\ea":"fza"'

# bind "ALT+e" to fuzzy edit files
bind -x '"\ee":"fze"'

# bind "ALT+d" to fuzzy edit dotfiles
bind -x '"\ed":"fzd"'

# bind "ALT+f" to fuzzy zoxide
bind -x '"\ef":"zi"'

#--| history |--#

# sets the amount of entries to be unlimited.
export HISTSIZE=""

# sets the filesize to be unlimited.
export HISTFILESIZE=""

# set time format.
export HISTTIMEFORMAT="[%d.%m.%y %T] "

# define commands that should be ignored.
# the commands must be separated by a double point and include the exact option- and flag parameters!
export HISTIGNORE="pwd:vim:ca:cb:sb:cP:cs:ll:cd:v:l:x:ls:ls -ltr:ls -lAhF:cd ..:.."

#--| shell options |--#

# sets the control filter.
export HISTCONTROL="ignoreboth"

# append to the history file, don't overwrite it
shopt -s histappend

# attempts to save all lines of a multiple-line command in the same history entry to allow easy re-editing of multi-line
# commands.
shopt -s cmdhist

# if the "cmdhist" option is enabled, multi-line commands are saved to the history with embedded newlines rather than
# using semicolon separators where possible.
shopt -u lithist

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# a command name that is the name of a directory is executed as if it were the argument to the "cd" command.
# this option is only used by interactive shells.
shopt -s autocd

# minor errors in the spelling of a directory component in a cd command will be corrected.
# the errors checked for are transposed characters, a missing character and a character too many.
# if a correction is found, the corrected path is printed, and the command proceeds.
# this option is only used by interactive shells.
shopt -s cdspell

# lists the status of any stopped and running jobs before exiting an interactive shell.
# if any jobs are running, this causes the exit to be deferred until a second exit is attempted without an intervening
# command.
# the shell always postpones exiting if any jobs are stopped.
shopt -s checkjobs

# replaces directory names with the results of word expansion when performing filename completion.
# this changes the contents of the readline editing buffer.
# if not set, bash attempts to preserve what the user typed.
shopt -s direxpand

# attempts spelling correction on directory names during word completion if the directory name initially supplied does
# not exist.
shopt -s dirspell

# includes filenames beginning with a '.' in the results of filename expansion.
shopt -s dotglob

# patterns which fail to match filenames during filename expansion result in an expansion error.
shopt -u failglob

# enables extended pattern matching features for auto completion options.
shopt -s extglob

# matches filenames in a case-insensitive fashion when performing filename expansion.
shopt -u nocaseglob

#--| applications |--#

# load icons for tui filemanger "lf"
if [ -f $XDG_CONFIG_HOME/lf/lficons.sh ]; then
    . $XDG_CONFIG_HOME/lf/lficons.sh
fi

# load fzfrc
if [ -f "${XDG_CONFIG_HOME}/shell/fzfrc" ]; then
    source "${XDG_CONFIG_HOME}/shell/fzfrc"
else
    echo "Note: '~/.config/shell/fzfrc' is unavailable"
fi

# load fzf keybindings
[[ -s "/usr/share/doc/fzf/examples/key-bindings.bash" ]] && source /usr/share/doc/fzf/examples/key-bindings.bash

# load "zoxide" a smarter cd command
if [ -x "$(command -v zoxide)" ]; then
    eval "$(zoxide init bash)"
else
    echo "Note: command 'zoxide' is unavailable."
fi

#--| broot |--#

if [ -f "$HOME"/.config/broot/launcher/bash/br ]; then
  source "$HOME"/.config/broot/launcher/bash/br
fi

#--| prompt |--#

# load prompt only if tty == console and exit ".bashrc"
if [[ "$TERM" = "linux" ]]; then
    if [ -f ~/.bash_prompt ]; then
        . ~/.bash_prompt
      else
        echo "Note: '~/.bash_prompt' is unavailable"
    fi
    if [ -f ~/.config/shell/tty-gruvbox_dark.sh ]; then
        . ~/.config/shell/tty-gruvbox_dark.sh
      else
        echo "Note: '~/.config/shell/tty-gruvbox_dark.sh' is unavailable"
    fi
    return
fi

# find out which distribution we are running on
_distro=$(awk '/^ID=/' /etc/*-release | awk -F'=' '{ print tolower($2) }')
# set an icon based on the distro
case $_distro in
    *kali*)                  ICON="ﴣ";;
    *arch*)                  ICON="";;
    *debian*)                ICON="";;
    *raspbian*)              ICON="";;
    *ubuntu*)                ICON="";;
    *elementary*)            ICON="";;
    *fedora*)                ICON="";;
    *coreos*)                ICON="";;
    *gentoo*)                ICON="";;
    *mageia*)                ICON="";;
    *centos*)                ICON="";;
    *opensuse*|*tumbleweed*) ICON="";;
    *sabayon*)               ICON="";;
    *slackware*)             ICON="";;
    *linuxmint*)             ICON="";;
    *alpine*)                ICON="";;
    *aosc*)                  ICON="";;
    *nixos*)                 ICON="";;
    *devuan*)                ICON="";;
    *manjaro*)               ICON="";;
    *rhel*)                  ICON="";;
    *freebsd*)               ICON="";;
    *openbsd*)               ICON="";;
    *endeavouros*)           ICON="";;
    *void*)                  ICON="";;
    *)                       ICON="";;
esac
export STARSHIP_DISTRO="$ICON "

# load starship prompt
if [ -x "$(command -v starship)" ]; then
    eval "$(starship init bash)"
else
    echo "Note: command 'starship' is unavailable."
fi
