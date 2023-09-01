terraform {
  backend "s3" {
    bucket = "petfstate"
    key    = "platform_Enginnering/VPC/terraform.tfstate"
    region = "us-east-1"
  }
}
