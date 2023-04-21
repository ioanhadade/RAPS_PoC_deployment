#installs libraries lke terraform and azcopy if you don't already have them
set -x
set -e

#Install terraform
#assumes your running rhel linux (yum) but you can swap them out
sudo yum install -y yum-utils
sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
sudo yum -y install terraform
terraform --version

#Install Azure CLI
sudo yum check-update & true
sudo yum install -y gcc libffi-devel python36u-devel openssl-devel
curl -L https://aka.ms/InstallAzureCli | bash

echo "now type 'az login' to complete setup"
az login #do i even need this if i'm just using service principals?

