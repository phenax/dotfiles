# Shell Macros
Write command line macros in bash and zsh

## Prerequisites
You need the `git` and `curl` to use the macros install script
```bash
sudo apt install git curl
```


## Installation
To install `macros`, run this script
```bash
curl https://raw.githubusercontent.com/phenax/shell-macros/master/install.sh | bash -
```


## Usage
Run the help command to see the list of available commands
```bash
macros help
```

#### Commands
```
Commands:
  start <macro name>    - Creates a new macro recording session
  run <macro name>      - Run a recorded macro
  ls                    - List all available macros
  delete <macro name>   - Delete a macro
  help                  - This dialog
```

#### Recording a macro
To generate a macro use the `macros start <name>` command
```bash
macros start my_macro_to_do_stuff
```

This will give you a new shell session to start executing your macro in.
So you can go ahead and run your set of commands.

When you are done, just run `exit` or press `Ctrl+D` to save and exit out of the session.
```bash
exit
```

#### Executing a macro
You can run your macro using the `macros run <name>` command
```bash
macros run my_macro_to_do_stuff
```


#### Adapter for bash
Add this to the bottom of your `~/.bashrc`
```bash
source $HOME/.config/shell-macros/adapters/bash;
```

#### Adapter for zsh
Add this to the bottom of your `~/.zshrc`
```bash
source $HOME/.config/shell-macros/adapters/zsh;
```


### Dynamic macros
You can also create dynamic macros using environment variables

```bash
BRANCH=my_branch macros start git_sync
```

Continue to use the branch name env variable in your macro session
```bash
git checkout $BRANCH;
git pull;
git pull origin master;
git push -u origin $BRANCH;
exit;
```

And then when you want to re-use the macro for a different branch, you can use pass the env variable to the `run` command as such

```bash
BRANCH=some_other_branch macros run git_sync
```

