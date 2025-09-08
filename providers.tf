provider "aws" {
  region     = "us-east-1"
}

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

terraform {
  backend "s3" {
    bucket         = "terraform-kamalb"
    key            = "terraform.tfstate"
    region         = "us-east-1"                   
    encrypt        = true                          
  }
}