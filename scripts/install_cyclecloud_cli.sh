#This script should be run AFTER you have created your cyclelcoud host using terraform apply
set -e

#get the IP of the cyclecloud host server
cd "$(dirname "$0")" #ensure we are in the RAPS_PoC_deployment/scripts dir
cd ../deploy-cyclecloud
export ip=$(terraform output public_ip_address | tr -d '"')

#instal the cyclecloud cli
cd /tmp
wget --no-check-certificate https://$ip/static/tools/cyclecloud-cli.zip
unzip cyclecloud-cli.zip
cd /tmp/cyclecloud-cli-installer
./install.sh

rm -rf cyclecloud-cli*

#initalize cyclecloud cli
export url=https://$ip
export username=$(cat terraform.tfvars | grep "cyclecloud_username" | awk '{print $3}' | tr -d '"')
export password=$(cat terraform.tfvars | grep "cyclecloud_password" | awk '{print $3}' | tr -d '"')
cyclecloud initialize --force --batch --url=$url --username=$username --password=$password --verify-ssl=false
