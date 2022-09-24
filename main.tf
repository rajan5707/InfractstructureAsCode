provider "aws" {
  access_key = "addyour access key"
  secret_key = "add your secret key"
  region     = "ap-south-1"
}
resource "aws_instance" "web" {
  count = 5
  ami           = "ami-06489866022e12a14"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["sg-0910a859df4b2ed77"]
  key_name          = "naveenaws"

  tags = {
    Name = "Hellow"
  }
}

/*
####### Saves  the pemkey in a local file ##########

resource "tls_private_key" "pk" {
  algorithm = "RSA"
#  rsa_bits  = 4096
}

resource "aws_key_pair" "kp" {
  key_name   = "myKey"       # Create a "myKey" to AWS!!
  public_key = tls_private_key.pk.public_key_openssh

  provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ./myKey.pem"
  }
}
#######################

output "public_ips" {
        value       = [aws_instance.web.*.public_ip]
  #value = aws_eip.one.public_ip
}
output "private_ips" {
        value       = [aws_instance.web.*.private_ip]
  #value = aws_eip.one.public_ip
}
*/
#############################

#>>> CREATES A FILE INVERNT.TXT WHICH CONATINS THE NEW LAUNCED PUBLIC IPS IN STRUCTURED FORMAT 

resource "local_file" "foo" {
 #   content  = [aws_instance.web.*.public_ip]
    filename = "invent.txt"
    #filename = "/etc/ansible/hosts"
    content = <<EOF

[k8all:children]
masters
workers

[masters]
k8master ansible_host=${aws_instance.web[0].public_ip} ansible_connection=ssh ansible_user=ec2-user

[workers]
k8worker1 ansible_host=${aws_instance.web[1].public_ip} ansible_connection=ssh ansible_user=ec2-user
k8worker2 ansible_host=${aws_instance.web[2].public_ip} ansible_connection=ssh ansible_user=ec2-user

[jenkinMaster]
jenkmaster ansible_host=${aws_instance.web[3].public_ip} ansible_connection=ssh ansible_user=ec2-user

[jenkinStage]
jenkStage-1 ansible_host=${aws_instance.web[4].public_ip} ansible_connection=ssh ansible_user=ec2-user

EOF
}
