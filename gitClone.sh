function gitInstall () {
        echo " >>>>:-----------------------------------  INSTALLING GIT "
        echo " >>>>: UPDATING THE PACKAGES "
        sudo yum update
        sudo yum install git -y
        echo " >>>>: Installed the resources needed for Git  "
        echo " >>>>: Terraform version is "
        git --version
}

function settingInfraStructureSetup () {
	#currentpath = $(pwd)	
        #mkdir $currentpath + InfraStructureSetup
        #mkdir /home/ec2-user/InfraStructureSetup
        #cd /home/ec2-user/InfraStructureSetup
        git init
        git clone $repoLink
	mv testassessment/* . #moving the files from gitProject direc to current path
}

repoLink=https://github.com/rajan5707/testassessment.git
gitInstall 
settingInfraStructureSetup

echo "==============================================================================="
echo " >>>>: CHANGE THE AWS RESOURCES IN main.tf"
echo " >>>>: Run the ./infraSetup.sh now"
