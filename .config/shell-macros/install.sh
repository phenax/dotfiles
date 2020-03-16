#!/usr/bin/env bash

SHELL_MACROS_PATH=$HOME/.config/shell-macros;
MACROS_BINARY=/usr/bin/macros;
PKGER_BINARY=/usr/bin/pkger-macros;

clone() {
  git clone https://github.com/phenax/shell-macros.git $SHELL_MACROS_PATH;
}

if [[ -d "$SHELL_MACROS_PATH" ]]; then
  echo "You already have shell-macros installed. Upgrading to latest release";

  echo "* Backing up old config..."
  TMP_SM_PATH="${SHELL_MACROS_PATH}_backup";
  rm -rf $TMP_SM_PATH;
  mv $SHELL_MACROS_PATH $TMP_SM_PATH;
  echo "";

  echo "* Upgrading...";
  clone;
  echo "";

  echo "* Restoring config...";
  cp -rf "$TMP_SM_PATH/dump" "$SHELL_MACROS_PATH";
  cp -rf "$TMP_SM_PATH/macros" "$SHELL_MACROS_PATH";
  cp -rf "$TMP_SM_PATH/config.sh" "$SHELL_MACROS_PATH";
else
  echo "* Installing...";
  clone;

  mkdir -p $SHELL_MACROS_PATH/dump;
  mkdir -p $SHELL_MACROS_PATH/macros;
fi;

rm -rf $SHELL_MACROS_PATH/.git;
echo "";

echo "* Configuring binary...";
if [[ ! -f "$MACROS_BINARY" ]]; then
  sudo ln -s "$SHELL_MACROS_PATH/macros.sh" "$MACROS_BINARY";
fi

if [[ ! -f "$PKGER_BINARY" ]]; then
  sudo ln -s "$SHELL_MACROS_PATH/pkger-macros.sh" "$PKGER_BINARY";
fi
echo "";

echo "Done!";
echo "";
echo "Run 'macros help' to get started";
