#!/bin/zsh

# overide function to support zsh-vi-mode plugins
function vi-mode-init() {
  # load fzf env 
  source "${HOME}/.config/zsh/env/fzf.zsh"
  eval "$(fzf --zsh)"

  # make widget
  zle -N y_widget y
  bindkey '^E' y_widget
}
zvm_after_init_commands+=(vi-mode-init)

function zvm_after_lazy_keybindings() {

  # make widget for vim normal mode
  zvm_define_widget y
  bindkey -M vicmd '^E' y
}
