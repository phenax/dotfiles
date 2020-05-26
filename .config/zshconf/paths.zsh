export XDG_CONFIG_HOME=$HOME/.config;
export XDG_DATA_HOME=$HOME/.local/share;
export PKG_CONFIG_PATH=/usr/lib/pkgconfig;

# Local scripts
export SCRIPTS_DIR="$HOME/scripts";
export SCRIPTS_BINARY_DIR="$HOME/.bin";
export COMMANDS_DIR="$HOME/scripts/commands";

# Lang specific stuff
export CARGO_HOME=$XDG_CONFIG_HOME/cargo;
export GEM_HOME=$HOME/.gem;
export GOROOT=/usr/lib/go;
export GOPATH=$HOME/dev/go;
export DENO_INSTALL="$HOME/.config/deno";

# Path
PATH=$GEM_HOME/ruby/2.7.0/bin:$GOPATH/bin:$GOROOT/bin:$CARGO_HOME/bin:$DENO_INSTALL/bin:$PATH;
PATH="$HOME/.local/bin:$PATH"
PATH="$SCRIPTS_BINARY_DIR:$PATH";
PATH="$COMMANDS_DIR:$PATH";
export PATH;

# Util config
export rofi_LIBS=/usr;
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg;
export PASSWORD_STORE_DIR=$XDG_CONFIG_HOME/password-store;

# Xmonad directory
export XMONAD_CONFIG_DIR=$XDG_CONFIG_HOME/xmonad;
export XMONAD_DATA_DIR=$XDG_DATA_HOME/xmonad;
export XMONAD_CACHE_DIR=$HOME/.cache/xmonad;

# Development dir variables
export DEV_DIR="$HOME/dev";
export PROJECTS_DIR="$DEV_DIR/projects";
export SHAADI=$PROJECTS_DIR/sh-react;
export REG_SHAADI=$PROJECTS_DIR/sh-profile-creation;

