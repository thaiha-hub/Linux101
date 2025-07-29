# Philosophy

* Everything is a file	All configuration files for the various services running on the Linux operating system are stored in one or more text files.
* Small, single-purpose programs	Linux offers many different tools that we will work with, which can be combined to work together.
* Avoid captive user interfaces	Linux is designed to work mainly with the shell (or terminal), which gives the user greater control over the operating system.
* Configuration data stored in a text file
# Components
* **Bootloader:**  A piece of code that runs to guide the booting process to start the operating system. Parrot Linux uses the GRUB Bootloader.
* **OS Kernel:**	  The kernel is the main component of an operating system. It manages the resources for system's I/O devices at the hardware level.
* **Daemons:**	    Background services are called "daemons" in Linux. Their purpose is to ensure that key functions such as scheduling, printing, and multimedia are working correctly.  
* **OS Shell:**	  The operating system shell or the command language interpreter (also known as the command line) is the interface between the OS and the user. The most commonly used shells are Bash, Tcsh/Csh, Ksh, Zsh, and Fish.
* **Graphics server:**	This provides a graphical sub-system (server) called "X" or "X-server" that allows graphical programs to run locally or remotely on the X-windowing system.
* **Window Manager:**	Also known as a graphical user interface (GUI).  
* **Utilities:** Applications or utilities
# Linux Architecture
* Hardware
* Kernel
* Shell
* System Utilities
# Filesystem Hierachy
* **/**	The top-level directory is the root filesystem and contains all of the files required to boot the operating system before other filesystems are mounted, as well as the files required to boot the other filesystems. After boot, all of the other filesystems are mounted at standard mount points as subdirectories of the root.
* **/bin**	Contains essential command binaries.
* **/boot**	Consists of the static bootloader, kernel executable, and files required to boot the Linux OS.
* **/dev**	Contains device files to facilitate access to every hardware device attached to the system.
* **/etc**	Local system configuration files. Configuration files for installed applications may be saved here as well.
* **/home**	Each user on the system has a subdirectory here for storage.
* **/lib**	Shared library files that are required for system boot.
* **/media**	External removable media devices such as USB drives are mounted here.
* **/mnt**	Temporary mount point for regular filesystems.
* **/opt**	Optional files such as third-party tools can be saved here.
* **/root**	The home directory for the root user.
* **/sbin**	This directory contains executables used for system administration (binary system files).
* **/tmp**	The operating system and many programs use this directory to store temporary files. This directory is generally cleared upon system boot and may be deleted at other times without any warning.
* **/usr**	Contains executables, libraries, man files, etc.
* **/var**	This directory contains variable data files such as log files, email in-boxes, web application related files, cron files, and more.

# Promt
The PS1 variable in Linux System controls how command promt looks in the terminal.  
By customise the PS1 variable, one can change the promt to display tailored information such as username, colors, special characters, etc.  

One can customize the PS1 to show other useful details such as IP-address, date, time, success or failure of the last command, etc. --> Especially useful in penetration test! (security) coz it helps to keep track of one's actions more effectively.  

~/.bash_history   shows the list of previously used commands.  

the promt can be customized using special characters and variables the shell's configuration file .bashrc

## apropos 
Search the description for a given keyword

# System information

	Displays current username.
* **id**	Returns users identity
* **hostname**	Sets or prints the name of current host system.
* **uname**	    Prints basic information about the operating system name and system hardware.
* **pwd** 	Returns working directory name.
* ifconfig	The ifconfig utility is used to assign or to view an address to a network interface and/or configure network interface parameters.  * **ip**	Ip is a utility to show or manipulate routing, network devices, interfaces and tunnels.
* **netstat**	Shows network status.
* **ss** Another utility to investigate sockets.
* ps	Shows process status.
* who	Displays who is logged in.
* env	Prints environment or sets and executes command.
* lsblk	Lists block devices.
* lsusb	Lists USB devices
* lsof	Lists opened files.
* lspci	Lists PCI devices.

