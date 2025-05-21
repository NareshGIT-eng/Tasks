terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  alias  = "east1"
  region = "us-east-1"
}
# Configure the AWS Provider
provider "aws" {
  alias  = "east2"
  region = "us-east-2"
}
