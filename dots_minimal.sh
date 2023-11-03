#!/bin/env bash
set -x

test -d "$HOME/.dotfiles" || { git clone https://github.com/rotzloeffel/dotfiles_public.git "$HOME/.dotfiles" ; }
stow -d "$HOME/.dotfiles" -t "$HOME" bash nvim ripgrep scripts shell starship ssh stow tmux wget vim nano git gpg lf

