# Alias
alias cr "composer require "
alias sy "php bin/console "
alias mdata "sudo mkdir -p /run/media/jonathan/Data && sudo ntfs-3g /dev/sda2 /run/media/jonathan/Data"
alias remove "pacaur -Rns"
alias ll 'eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias upgrade 'yay -Syu --editmenu && flatpak update' # Upgrade the system
alias fserve 'caddy file-server --listen :8000 --browse' # Serve the current directory
alias webcam 'mpv av://v4l2:/dev/video0 --profile=low-latency --untimed' # Show the webcam

function trash --description "Move files to trash"
    gio trash $argv
end

# Docker
alias dk "docker kill (docker ps -q)"
alias de "docker-compose exec"
alias dprune "docker system prune --filter \"until=720h\" && docker volume prune"

# Sail
alias sail "bash vendor/bin/sail"

set -gx EDITOR nvim

# SSH agent
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

# PHP
set -x PATH $PATH $HOME/.config/composer/vendor/bin

# Local bin
set -gx PATH "$HOME/.local/bin" $PATH
set -x PATH $PATH $HOME/.bin

# Golang
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH

# Bun
set -Ux BUN_INSTALL "/home/jonathan/.bun"
set -px --path PATH "/home/jonathan/.bun/bin"

# Android
set -gx ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH $PATH "$ANDROID_HOME/emulator"
set -gx PATH $PATH "$ANDROID_HOME/platform-tools"
set -gx JAVA_HOME /usr/lib/jvm/default
set -gx EDGE_PATH /usr/bin/brave

# Volta
set -gx VOLTA_FEATURE_PNPM 1

# pnpm
set -gx PNPM_HOME "/home/jonathan/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end
