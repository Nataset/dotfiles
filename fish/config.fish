set fish_greeting

# set theme
# theme_gruvbox dark

# set $PATH
set -x PATH $PATH /usr/local/bin
set -x PATH $PATH $HOME/.local/bin
set -x PATH $PATH $HOME/.cargo/bin

# set ENV
set -Ux EDITOR nvim
set -Ux VISUAL nvim
# set -Ux GIT_EDITOR nvim

set -Ux XDG_CONFIG_HOME "$HOME/.config"

# fnm init
set -x PATH "/home/nataset/.local/share/fnm" $PATH
  fnm env | source

# zoxide init
zoxide init fish | source

# start ship init
starship init fish | source

# alias
if type -q exa
    alias ll "exa -l -g --icons"
    alias lla "ll -a"
end

# alias vim "nvim --listen /tmp/nvim-server.pipe"
# alias nvim "nvim --listen /tmp/nvim-server.pipe"
alias lg lazygit
alias nvim="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"
alias vim="nvim --listen /tmp/nvim-server-$(tmux display-message -p '#S').pipe"

# fzf
fzf_configure_bindings --directory=\co

set fzf_preview_file_cmd "bat --style=numbers --color=always --line-range :500"

# key-binding
function fish_user_key_bindings

    fish_vi_key_bindings
    # set_kj_to_exit

    bind -M insert \cf accept-autosuggestion
    # bind \cf accept-autosuggestion

    bind -M insert \ce lfcd
    bind \ce lfcd
end
