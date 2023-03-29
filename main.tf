terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "rafaelfb-remote-sta"
    key    = "aws-vm-pipeline-github-actions/terraform.tfstate"
    region = "us-east-1"

  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      owner      = "rafaelfb"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
    config = {
      bucket = "rafaelfb-remote-sta"
      key    = "aws-vpc/terraform.tfstate"
      region = "us-east-1"
    }
  }
