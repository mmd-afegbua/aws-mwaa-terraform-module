terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.37.0"
    }
    random = {
      source = "hashicorp/random"
      version = ">= 2.2"
    }
  }
}

provider "aws" {
 alias                   = "current" 
 region                  = "us-west-1"
}