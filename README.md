# RAPS\_PoC\_deployment
Project which creates everything you need to deploy HPC clusters on Azure and to begin testing ECMWF codes.

## Install required programs
First, install the azure cli and terraform if required. Terraform is a tool for automating cloud deployment and it requires the azure CLI to be able to deploy Azure instances
the script "scripts/install\_prereqs.sh" will try install terraform and the azure cli for you. If succseful, you will be prompted to log in.


## Deploy a Cyclecloud server
Cyclecloud is 
2: use terraform to create a vm which hosts cyclecloud


4: uploads a custom cluster template to cyclecloud. This comes preloaded with additional compilers and MPI libraries as well as the IFS dwarves and evntually RAPS

5: create and launch a cluster via the cyclecloud gui


## Image creation

create an image which has all the keys and libraries required to run this repo from scratch. this is a list of keys and libraries required as they come up
1: github key 
        if this is a frsh vm make sure you get the key (e.g. from cathals_personal_vm ~/.shh/github)
        and add this to ~/.ssh/config:
                Host github.com
                        User git
                        Hostname github.com
                        IdentityFile ~/.ssh/github

        if you get a "bad permissions" error when cloning run this:
                chmod 700 ~/.ssh
                chmod 600 ~/.ssh/*
2: clone this repo itself
	git clone git@github.com:cathalobrien/RAPS_PoC_deployment.git

3: install terraform
	sudo yum install -y yum-utils
	sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
	sudo yum -y install terraform
