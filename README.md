# autobeef
Scripts and docs to automate a beef workflow

## Pre-Reqs
- Vulnerable Target VM
- AWS account and permissions to start and configure EC2 nodes
- Knowledge of your public IP (www.whatsmyip.org)

## AWS nodes set up
* Create BeEF security group
  * Inbound rules 22 and 3000 from your public IP
  * Outbound rules All traffic
* Create metasploit security group
  * Inbound rules 22, 80, and 4444 from your public IP
  * Outbound rules All traffic
* Create BeEF EC2 node
  * Use ami-00ddb0e5626798373 (Ubuntu 18.04 in N. Virginia)
  * Copy setupbeef.sh (scp -i <pem> setupbeef.sh ubuntu@<ip>:. ) and run (chmod 744 setupbeef.sh; ./setupbeef.sh)
* Create metasploit EC2 node
  * Use ami-00ddb0e5626798373 (Ubuntu 18.04 in N. Virginia)
  * Copy setupmetasploit.sh (scp -i <pem> setupmetasploit.sh ubuntu@<ip>:.) and run chmod 744 setupmetasploit.sh; ./setupmetasploit.sh)
  * When the setupmetasploit.sh script completes, run msfconsole and set up the inintial database (accept defaults). When finished, type quit and press enter.

## Configure workflow
* Get target info (simulation). Help select exploit and config data.
* Start metasploit exploit
  * Copy ms10_018_ieb.rc to metasploit server (scp -i <pem> ms10_018_ieb.rc ubuntu@<ip>:.)
  * Edit ms10_018_ieb.rc with public IP, port, URIPATH, LHOST, and LPORT. 
  * Start msfconsole with rc file (sudo msfconsole -qr ms10_018_ieb.rc)
* Configure autorun script with BeEF
  * Copy iframe.json to BeEF server (scp -i <pem> iframe.json ubuntu@<ip>:.)
  * Edit iframe.json with URI created from metasploit
  * Copy iframe.json to beef/arerules/enabled/
* Go to target VM and browse to http://<beef_public_ip>:3000/demos/basic.html
* If all goes well, you should have a new meterpreter session on the metasploit server (session -l)
