# ENV
export GPG_TTY=(tty)
fish_add_path $HOME/.local/bin
fish_add_path $GOPATH/bin
set XDG_CONFIG_HOME $HOME/.config
set XDG_CACHE_HOME $HOME/.cache
set XDG_DATA_HOME $HOME/.local/share

# Cleanup
export BROWSER=firefox
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export EDITOR=vim
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg
export GOPATH="$XDG_DATA_HOME"/go
export LESSHISTFILE=-
export WGETRC="$XDG_CONFIG_HOME/wgetrc"

# FF Pinch to Zoom
export MOZ_ENABLE_WAYLAND=1
export MOZ_USE_XINPUT2=1

## .android
export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android/
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android

## .gnupg
export GNUPGHOME="$XDG_CONFIG_HOME"/gnupg

## Directories
set undodir $XDG_DATA_HOME/vim/undo
set directory $XDG_DATA_HOME/vim/swap
set backupdir $XDG_DATA_HOME/vim/backup

# Alias
alias tmux="tmux -2u -f "$XDG_CONFIG_HOME"/tmux/tmux.conf"

# To run X apps -in-host-> Xwayland :13 -in-container-> DISPLAY=:13 appwithgui
# otherwise wayland had been already shared
abbr wdrun "docker run -ti -e XDG_RUNTIME_DIR=/tmp -e WAYLAND_DISPLAY=wayland-1 -v /tmp/.X11-unix:/tmp/.X11-unix -v /run/user/1000/wayland-1:/tmp/wayland-1 --user=(id -u):(id -g) --rm "

bind \es 'fish_commandline_prepend sudo'
bind \en "commandline -a ' &| nvim'"

umask 027

# Import grc
if test -f /etc/grc.fish
  source /etc/grc.fish
end

# Import zoxide
if test -f /bin/zoxide
  zoxide init fish | source
  alias cd 'z'
end
