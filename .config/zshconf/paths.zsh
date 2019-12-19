
export GOROOT=/usr/lib/go-1.10
export GOPATH=$HOME/dev/go
export DENO_INSTALL="/home/akshayn/.deno"

export PATH=$GOPATH/bin:$GOROOT/bin:$HOME/.cargo/bin:$HOME/.cabal/bin:/home/linuxbrew/.linuxbrew/bin:$PATH
export PATH=$HOME/.config/bash-aliases/bin:$PATH;
export PATH="$DENO_INSTALL/bin:$PATH"

# Development dir variables
export SHAADI=$HOME/dev/shaadi-react;
export REG_SHAADI=$HOME/dev/shaadi-profile-creation;

export rofi_LIBS=/usr
export PKG_CONFIG_PATH=/usr/lib/pkgconfig

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# export MANPATH="/usr/local/man:$MANPATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/akshayn/.sdkman"
[[ -s "/home/akshayn/.sdkman/bin/sdkman-init.sh" ]] && source "/home/akshayn/.sdkman/bin/sdkman-init.sh"

