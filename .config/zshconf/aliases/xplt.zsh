export WORDLISTS=~/dev/xploits/wordlist;
export ROCK_YOU_WORDS="$WORDLISTS/rockyou.txt";
export URL_WORDS="$WORDLISTS/dirb/common.txt";

alias msfc="msfconsole --quiet -x \"db_connect postgres@msf\""

alias ssplt="searchsploit"
alias sspx="searchsploit -x"

alias crawl="gobuster dir -w $URL_WORDS"

jrock() {
  [[ "$#" != "2" ]] && echo "jrock (format) (hashfile)" && return 1;
  john -format="$1" "$2" -wordlist=$ROCK_YOU_WORDS;
}

hrock() {
  [[ "$#" != "2" ]] && echo "hrock (mode-num) (hashfile)" && return 1;
  hashcat -m "$1" "$2" -o ./out $ROCK_YOU_WORDS --force;
}

hydru() {
  [[ "$#" != "2" ]] && echo "hydru (username) (host)" && return 1;
  hydra -l $1 -P $ROCK_YOU_WORDS ssh://$2;
}

