provider "aws" {
  region     = "us-east-1"
}

terraform {
  required_version = ">= 1.5.0" # Set a specific version constraint
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.0" # Fixes the next warning as well
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

