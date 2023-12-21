terraform {
  cloud {
    organization = "findnull"
    workspaces {
        name = "terraform-eks"
    }
  }
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.31.0"
    }
    kubernetes = {
        source = "hashicorp/kubernetes"
        version = "2.24.0"
    }
  }

  required_version = "~> 1.6.0"
}

provider "aws" {
    alias = "Singapore"
    region = "ap-southeast-1"
    sts_region = "ap-southeast-1"
  }
