terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "5.15.0"
        }
    }
    backend "s3" {
    bucket = "roboshop1-bucket"
    key = "foreach"
    region = "us-east-1"
    dynamodb_table = "roboshop-locking"
  }

}
provider "aws" {
    region = "us-east-1"
}