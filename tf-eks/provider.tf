terraform {
  required_version = "1.16.4"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.35.1"
    }
  }
}
 
provider "aws" {
    region = "ap-northeast-1"
}