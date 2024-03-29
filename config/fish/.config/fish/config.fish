# Alias
alias cr "composer require "
alias phpd "php -S localhost:8000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1"
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

# NPM
set -x PATH $PATH $HOME/.npm-global/bin

# PHP
set -x PATH $PATH $HOME/.config/composer/vendor/bin
set -x PATH $PATH $HOME/.bin

# Volta
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# Golang
set -gx GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin" $PATH 
