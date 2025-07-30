## ls
ls --color=auto/always/never   display outputs in different colors 
ls /                           list files and directories under / aka the root directory of the file system

## How to find the mail path
```bash
ls -l /var/mail  
ls -l /var/spool/mail     #look for the user  
ls -la /home/user         #look for maildir
env | grep MAIL           # check the Environment variable and look for MAIL, MAILPATH, MAILDIR
```

# Bash scripting
