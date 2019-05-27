provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "webplumbr-terraform-bucket-001"
}
