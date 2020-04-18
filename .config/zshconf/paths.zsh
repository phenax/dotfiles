
# Lang specific stuff
export GOROOT=/usr/lib/go
export GOPATH=$HOME/dev/go
export DENO_INSTALL="/home/akshayn/.deno"

# Local scripts
export SCRIPTS_DIR="$HOME/scripts";
export SCRIPTS_BINARY_DIR="$SCRIPTS_DIR/bin";

# Path
PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.cargo/bin:$HOME/.cabal/bin:/home/linuxbrew/.linuxbrew/bin:$PATH;
PATH=$HOME/.config/bash-aliases/bin:$PATH;
PATH=$HOME/.gem/ruby/2.7.0/bin:$PATH;
PATH="$DENO_INSTALL/bin:$PATH";
PATH="$SCRIPTS_BINARY_DIR:$PATH";
PATH="$HOME/.local/bin:$PATH"
PATH="$HOME/.bin:$PATH"
export PATH;

# Development dir variables
export DEV_DIR="$HOME/dev";
export PROJECTS_DIR="$DEV_DIR/projects";
export SHAADI=$PROJECTS_DIR/sh-react;
export REG_SHAADI=$PROJECTS_DIR/sh-reg;

export rofi_LIBS=/usr
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# export MANPATH="/usr/local/man:$MANPATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/akshayn/.sdkman"
[[ -s "/home/akshayn/.sdkman/bin/sdkman-init.sh" ]] && source "/home/akshayn/.sdkman/bin/sdkman-init.sh"

