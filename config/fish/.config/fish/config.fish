# Alias
alias cr "composer require "
alias phpd "php -S localhost:8000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1"
alias sy "php bin/console "
alias remove "pacaur -Rns"
# Docker
alias dk "docker kill (docker ps -q)"
alias de "docker-compose exec"
alias dprune "docker system prune --filter \"until=720h\" && docker volume prune"

# NPM
set -x PATH $PATH $HOME/.npm-global/bin

# PHP
set -x PATH $PATH $HOME/.config/composer/vendor/bin
set -x PATH $PATH $HOME/.bin
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH

# SSH Agent
eval (ssh-agent -c) > /dev/null
