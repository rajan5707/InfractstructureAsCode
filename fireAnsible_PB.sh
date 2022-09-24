
#Install respective dependicies on the following hosts

echo ">>>>: RUNNING THE ANSIBLE-PLAYBOOK FOR JENKIN MASTER "
ansible-playbook jenkMaster.yaml -i invent.txt

echo ">>>>: RUNNING THE ANSIBLE-PLAYBOOK FOR JENKIN STAGING "
ansible-playbook jenkStage.yaml -i invent.txt


echo ">>>>: RUNNING THE ANSIBLE-PLAYBOOK FOR K8s-packages "
ansible-playbook k8s-pkg.yml -i invent.txt

echo ">>>>: RUNNING THE ANSIBLE-PLAYBOOK FOR k8s-master "
ansible-playbook k8s-master.yml -i invent.txt

echo ">>>>: RUNNING THE ANSIBLE-PLAYBOOK FOR k8s-workers "
ansible-playbook k8s-workers.yml -i invent.txt
