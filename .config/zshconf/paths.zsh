export XDG_CONFIG_HOME=$HOME/.config;
export XDG_DATA_HOME=$HOME/.local/share;
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# Local scripts
export SCRIPTS_DIR="$HOME/scripts";
export SCRIPTS_BINARY_DIR="$HOME/.bin";

# Lang specific stuff
export GOROOT=/usr/lib/go;
export GOPATH=$HOME/dev/go;
export DENO_INSTALL="/home/akshayn/.deno"

# Path
PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.cargo/bin:$HOME/.cabal/bin:/home/linuxbrew/.linuxbrew/bin:$PATH;
PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH;
PATH="$DENO_INSTALL/bin:$PATH";
PATH="$SCRIPTS_BINARY_DIR:$PATH";
PATH="$HOME/.local/bin:$PATH"
PATH="$SCRIPTS_BINARY_DIR:$PATH"
export PATH;

# Development dir variables
export DEV_DIR="$HOME/dev";
export PROJECTS_DIR="$DEV_DIR/projects";
export SHAADI=$PROJECTS_DIR/sh-react;
export REG_SHAADI=$PROJECTS_DIR/sh-profile-creation;

# Util config
export rofi_LIBS=/usr;
export GNUPGHOME=$XDG_CONFIG_HOME/gnupg;
export PASSWORD_STORE_DIR=$XDG_CONFIG_HOME/password-store;

