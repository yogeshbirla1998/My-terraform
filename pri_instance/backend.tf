terraform {
  backend "s3" {
    bucket = "pe2dev"
    key    = "platform_Enginnering/private_Instance/terraform.tfstate"
    region = "us-east-1"
  }
}
