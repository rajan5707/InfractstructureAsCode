

function ansibleInstall () {
        echo " >>>>:----------------------------------- INSTALLING ANSIBLE "
        echo " >>>>: UPDATING THE PACKAGES "
        sudo yum update
        sudo amazon-linux-extras list | grep ansible2
        sudo amazon-linux-extras enable ansible2
        sudo yum install -y ansible
        echo " >>>>: Installed the resources needed for Ansible "
        echo " >>>>: Ansible version is "
        ansible --version
}

function terrformInstall () {
        echo " >>>>:-----------------------------------  INSTALLING TERRAFORM "
        echo " >>>>: UPDATING THE PACKAGES "
        sudo yum update
        sudo yum install wget unzip -y
        wget https://releases.hashicorp.com/terraform/0.14.7/terraform_0.14.7_linux_amd64.zip
        sudo unzip terraform_0.14.7_linux_amd64.zip
        sudo mv terraform /usr/bin/
        echo " >>>>: Installed the resources needed for terraform  "
        echo " >>>>: Terraform version is "
        terraform --version
}


echo "Installing the terrform "
terrformInstall

echo "Installing Ansible"
ansibleInstall

echo ">>>>: FIRING TERRAFORM TO SPIN UP THE INSTANCES"
echo ">>>>: HOPE YOU HAVE CHANGED THE AWS-REOSURCES "
./runTF_cmd


echo "--######### RUN THE BELOW COMMANDS MANUALLY TO SETUP SSH ###########-----"
echo "ssh-agent bash"
echo "cp naveen.pem ~/.ssh/"
echo "sudo chmod 600 ~/.ssh/naveen.pem"
echo "ssh-add ~/.ssh/naveen.pem"

echo "CHECK THE ANSIBLE PING BY FIRING THE BELOW COMMAND"
echo "ansible all -m ping -i invent.txt"
echo "if all nodes are pinging then fire this ./fireAnsible_PB.sh"

