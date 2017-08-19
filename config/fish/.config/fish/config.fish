# Alias
alias cr "composer require "
alias phpd "php -S localhost:8080 -ddisplay_errors=1 -dzend_extension=xdebug.so -dxdebug.remote_enable=1 -dxdebug.remote_autostart=1 -t public"
alias remove "pacaur -Rns"

# Android
set -x EDITOR /usr/bin/vim
set -x ANDROID_HOME $HOME/.android
set -x JAVA_HOME /usr/lib/jvm/java-8-jdk

# golang
set -x GOPATH $HOME/.config/go
set -x PATH $PATH $GOPATH/bin