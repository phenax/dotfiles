
# Lang specific stuff
export GOROOT=/usr/lib/go-1.10
export GOPATH=$HOME/dev/go
export DENO_INSTALL="/home/akshayn/.deno"

# Local scripts
export SCRIPTS_DIR="$HOME/scripts";
export SCRIPTS_BINARY_DIR="$SCRIPTS_DIR/bin";

# Path
export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.cargo/bin:$HOME/.cabal/bin:/home/linuxbrew/.linuxbrew/bin:$PATH;
export PATH=$HOME/.config/bash-aliases/bin:$PATH;
export PATH="$DENO_INSTALL/bin:$PATH";
export PATH="$SCRIPTS_BINARY_DIR:$PATH";

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

