# Alias
alias cr "composer require "
alias sy "php bin/console "
alias remove "pacaur -Rns"
alias ls 'eza --icons=auto' # ls replacement
alias ll 'eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias upgrade 'yay -Syu --noconfirm && flatpak update' # Upgrade the system
alias fserve 'caddy file-server --listen :8000 --browse' # Serve the current directory
alias webcam 'mpv av://v4l2:/dev/video0 --profile=low-latency --untimed' # Show the webcam

# Docker
alias dk "docker kill (docker ps -q)"
alias de "docker-compose exec"
alias dprune "docker system prune --filter \"until=720h\" && docker volume prune"

# Sail
alias sail "bash vendor/bin/sail"

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

