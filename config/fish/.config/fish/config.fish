# Alias
alias cr "composer require "
alias sy "php bin/console "
alias remove "pacaur -Rns"

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

