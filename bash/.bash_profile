#--| $HOME/.bash_profile |--#

#--| applications |--#

if [[ "$(command -v nvim)" ]]; then
  export VISUAL='nvim'
  export EDITOR='nvim'
fi

#if [[ "$(command -v emacsclient)" ]]; then
# export EDITOR="emacsclient -t -a ''"
# export VISUAL="emacsclient -c -a emacs"
#fi

if [[ "$(command -v rg)" ]]; then
  if [ -f "${HOME}/.config/ripgrep/ripgreprc" ]; then
    export RIPGREP_CONFIG_PATH="$HOME/.config/ripgrep/ripgreprc"
  fi
fi

export PAGER='less'
export TERMINAL='wezterm'
export READER="zathura"
export VIDEO="mpv"
export BROWSER='firefox'
export IMAGE="imv"
export TTY=$(tty)
export GPG_TTY="$(tty)"

#--| xdg |--#

export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CURRENT_DESKTOP=Sway
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOCUMENTS_DIR="${HOME}/documents"
export XDG_DOWNLOAD_DIR="${HOME}/downloads"
export XDG_MUSIC_DIR="${HOME}/music"
export XDG_PICTURES_DIR="${HOME}/pictures"
export XDG_RUNTIME_DIR=/run/user/1000
export XDG_SESSION_TYPE=wayland
export XDG_SESSION_DESKTOP=sway
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_VIDEOS_DIR="${HOME}/videos"
test -d "$XDG_RUNTIME_DIR" || { mkdir "$XDG_RUNTIME_DIR" ; chmod 700 "$XDG_RUNTIME_DIR" ; }

#--| wayland |--#

export BEMENU_BACKEND=wayland
export CLUTTER_BACKEND=wayland
export GDK_BACKEND=wayland
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1
export MOZ_WEBRENDER=1
export QT_AUTO_SCREEN_SCALE_FACTOR=1
export QT_QPA_PLATFORM=wayland
export QT_QPA_PLATFORMTHEME=qt5ct
export QT_WAYLAND_DISABLE_WINDOWDECORATION=1
export SDL_VIDEODRIVER=wayland
export WLR_DRM_NO_ATOMIC=1
export _JAVA_AWT_WM_NONREPARENTING=1

#--| less |--#

#export LESS="-RFi"
export LESS="-SXIFRs"
export LESSHISTFILE="-"
export LESS_TERMCAP_mb=$'\E[1;32m'
export LESS_TERMCAP_md=$'\E[01;34m' LESS_TERMCAP_me=$'\E[1m' GROFF_NO_SGR=1
export LESS_TERMCAP_se=$'\E[0m' LESS_TERMCAP_so=$'\E[01;31m'
export LESS_TERMCAP_us=$'\E[04;36m' LESS_TERMCAP_ue=$'\E[0m'
export MANPAGER="less"

#--| misc |--#

export CLICOLOR=1
export ESCDELAY=0
export MPD_HOST="127.0.0.1"
export PROMPT_EOL_MARK=""
export WGETRC="$XDG_CONFIG_HOME/wget/wgetrc"
export _ZO_DATA_DIR="$HOME/.local/share/zoxide"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export GTK_USE_PORTAL=0
export LYNX_CFG_PATH="$XDG_CONFIG_HOME/lynx/"
export LYNX_CFG="$XDG_CONFIG_HOME/lynx/lynx.cfg"
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/1000/bus
export SUDO_PROMPT="[sudo]  %p's password: "

#--| video hardware acceleration |--#

export LIBVA_DRIVER_NAME=iHD
export VDPAU_DRIVER=va_gl
export VAAPI_MPEG4_ENABLED=true

#--| console |--#

if [[ "$TTY" == /dev/tty*[0-9]* ]]; then
  unset LF_ICONS
fi

#--| read .bashrc |--#

if [ -f "$HOME"/.bashrc ]; then
  source "$HOME"/.bashrc
fi
