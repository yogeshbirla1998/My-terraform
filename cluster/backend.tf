terraform {
  backend "s3" {
    bucket = "pe2dev"
    key    = "platform_Enginnering/cluster/terraform.tfstate"
    region = "us-east-1"
  }
}
