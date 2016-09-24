# [BASH] SSH Killer

Bash script that removes all ssh session, except your.

### Installing

Upload `sk.sh` on your server via ssh.

Grant executable permissions.
```sh
$ sudo chmod +x sk.sh
```

### Usage
Run script using `bash`
```sh
$ sudo bash sk.sh
```
When somebody else connects to server via ssh, script will kill session of that user.

Example of output:
```sh
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
		 safe pts/7  	 kill  pts/15  

 11:20:29 up 1 day,  1:17,  2 users,  load average: 0.10, 0.05, 0.05
USER     TTY      FROM             LOGIN@   IDLE   JCPU   PCPU WHAT
sshuser  pts/15   router           11:02   17:47   0.05s  0.05s -bash
sshuser  pts/7    192.168.1.1      09:29    4.00s  0.35s  0.00s w

 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
```
`safe pts/7` - your current ssh session that will not be killed.

`kill  pts/15` - another user ssh session that has been killed.

You can add one additional safe `pts`. Just run script with parameter.

Example of running script with additional parameter:
```sh
$ sudo bash sk.sh pts/15
```
Now script will safe you session and `pts/15` like in example and will kill other sessions.

Script checks ssh connections every 2 seconds, you can change it in code, just edit line with `sleep 2`, where `2` is seconds.

License
----
MIT
