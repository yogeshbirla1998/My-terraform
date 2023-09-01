terraform {
  backend "s3" {
    bucket = "petfstate"
    key    = "platform_Enginnering/public_Instance/terraform.tfstate"
    region = "us-east-1"
  }
}
