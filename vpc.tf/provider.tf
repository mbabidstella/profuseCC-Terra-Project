terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.30.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

terraform {
  backend "s3" {
    bucket = "mybucket"                    #for bucket name
    key    = "path/to/my/key"           #for file or object in the bucket and path to this file
    region = "us-east-1"
Dynamousdb_table = "firstprojectdb"
  }
}
