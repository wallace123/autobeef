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
  * Copy setupbeef.sh (scp -i <pem> ubuntu@<ip>:. ) and run (chmod 744 ./setupbeef.sh; ./setupbeef.sh)
* Create metasploit EC2 node
  * Use ami-00ddb0e5626798373 (Ubuntu 18.04 in N. Virginia)
  * Copy setupmetasploit.sh and run (chmod 744 ./setupmetasploit.sh ./setupmetasploit.sh)

## Configure workflow
