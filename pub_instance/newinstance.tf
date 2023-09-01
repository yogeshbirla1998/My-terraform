provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}

#private instance creation

/* resource "aws_instance" "priv_instance" {
  count = var.instance_count
  
  root_block_device {
    volume_size = var.storage_size
  }
  
  ami                         = var.amiId
  instance_type               = var.InstanceType
  associate_public_ip_address = false
  
  vpc_security_group_ids = [aws_security_group.security_sg.id]
  subnet_id              = element(data.terraform_remote_state.vpc.outputs.private_subnets, count.index)
  
  key_name   = var.key_name
  user_data  = file("./myscript.sh")
  
  tags = {
    Name   = "${var.Name}-${count.index + 1}"
    Owner  = var.Owner
    mailID = var.mailID
  }
} */


#Public Instance for Jump-Box Creation

resource "aws_instance" "public_instance" {
  root_block_device {
    volume_size = var.storage_size
  }
  
  ami                         = var.ami-Id
  instance_type               = var.InstanceType
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.security_sg_pub.id]
  subnet_id              = data.terraform_remote_state.vpc.outputs.public_subnets[0]
  
  key_name   = var.key_name
  user_data  = file("./myscript.sh")
  
  tags = {
    Name   = "${var.Name}-Jump-Box"
    Owner  = var.Owner
    mailID = var.mailID
  }
}
