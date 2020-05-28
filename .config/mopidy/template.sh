#!/usr/bin/env bash

TEMPLATE_FILE=mopidy.template.conf;
TARGET_FILE=mopidy.conf;

get_template_content() {
  echo "## DO NOT EDIT. THIS FILE IS GENERATED FROM A TEMPLATE";
  echo "##";
  echo "##";
  cat $TEMPLATE_FILE;
}

write_var() { echo "s/{{{$1}}}/$2/g"; }

write_variables() {
  local sp_user="beastmaster651";
  local sp_pass=$(pass Spotify/phenax5);
  local sp_client_id=$(pass MPD/client_id);
  local sp_client_secret=$(pass MPD/client_secret);
  sed \
    -e $(write_var 'sp.pass'           $sp_pass) \
    -e $(write_var 'sp.user'           $sp_user) \
    -e $(write_var 'sp.client_id'      $sp_client_id) \
    -e $(write_var 'sp.client_secret'  $sp_client_secret) \
  ;
}

template() {
  get_template_content | write_variables > $TARGET_FILE;
}

template;

