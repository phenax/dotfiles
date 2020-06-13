
take() {
  mkdir -p $@ && cd ${@:$#}
}

alias ..="cd ..";
alias ...="cd ../..";

