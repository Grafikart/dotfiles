# Alias
alias cr "composer require "
alias phpd "php -S localhost:8000 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1 -dxdebug.remote_autostart=1"
alias remove "pacaur -Rns"

# Android
set -x EDITOR /usr/bin/vim
set -x TERM xterm
set -x ANDROID_HOME $HOME/.android
set -x JAVA_HOME /usr/lib/jvm/java-8-jdk
set -x PATH $PATH $JAVA_HOME/bin

# golang
set -x GOPATH $HOME/.config/go
set -x PATH $PATH $GOPATH/bin

# Ruby
set -x PATH $PATH $HOME/.gem/ruby/2.4.0/bin

# NPM
set -x PATH $PATH $HOME/.npm-global/bin
rvm default
