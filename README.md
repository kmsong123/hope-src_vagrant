# Stable Vagrant VM Working Environment for Hope-Src Toolchain

## Overview
This project leverages Vagrant, a tool for managing virtual environments, to create a stable build environment and process for the hope-src toolchain.

To learn more about Vagrant: `https://www.vagrantup.com/docs`
 
## Quick-Start Guide:

##### Prerequisite installs:
Run the pre-install script: `./pre-install.sh`.
This script installs Vagrant as well as necessary Vagrant plugins and VM providers.

##### Create Vagrant VM Working Environment:
To create the VM: `sudo vagrant up`
This will create the virtual machine "default" with the hope-src cloned and built.  Note that the build currently takes approximately 4 hours to complete.  

To enter VM shell after provisioning is complete: `sudo vagrant ssh default`

##### Miscellaneous Commands and Notes:
To see all running VM's: `sudo vagrant global-status --prune`.  
To destroy VM's: `sudo vagrant destroy -f <name of VM>`.  
Note that the folder `vagrant_shared` is a shared folder between the host and VM. 
This shared folder will be mounted inside the home directory of the virtual machine.

