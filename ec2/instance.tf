provider "aws" {
  region = "us-east-1"
}

data "terraform_remote_state" "vpc" {
  backend = "local"
  config = {
    path = "../vpc/terraform.tfstate"
  }
}

resource "aws_instance" "priv_instance" {
  count = var.instance_count
  
  root_block_device {
    volume_size = var.storage_size
  }
  
  ami                         = var.ami-Id
  instance_type               = var.InstanceType
  associate_public_ip_address = false
  
  vpc_security_group_ids = [data.terraform_remote_state.vpc.outputs.default_security_group_id]
  subnet_id              = element(data.terraform_remote_state.vpc.outputs.private_subnets, count.index)
  
  key_name   = var.key_name
  user_data  = file("./myscript.sh")
  
  tags = {
    Name   = "instance-${count.index + 1}"
    Owner  = var.Owner
    mailID = var.mailID
  }
}

