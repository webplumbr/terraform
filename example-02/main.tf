provider "aws" {
  region = "ap-southeast-2"
}

locals {
    bucket_name = "webplumbr-terraform-bucket-001"
}

resource "aws_s3_bucket" "my_first_bucket" {
  bucket = "${local.bucket_name}"
}

output "bucket_name" {
  value = "${aws_s3_bucket.my_first_bucket.arn}"
}

data "template_file" "bucket_policy" {
  template = "${file("policy.json")}"

  vars = {
    bucket_arn = "${aws_s3_bucket.my_first_bucket.arn}"
  }
}

resource "aws_iam_policy" "my_bucket_policy" {
  name = "my-bucket-policy"
  policy = "${data.template_file.bucket_policy.rendered}"
}

output "bucket_policy" {
    value = "${aws_iam_policy.my_bucket_policy.policy}"
}