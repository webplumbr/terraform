provider "aws" {
    region = "ap-southeast-2"
}

module "versioned_bucket" {
    source = "./s3"
    bucket_name = "webplumbr-versioned"
    versioning = true
}

module "non_versioned_bucket" {
    source = "./s3"
    bucket_name = "webplumbr-non-versioned"
}

output "versioned_bucket_arn" {
    value = "${module.versioned_bucket.s3_bucket_arn}"
}

output "non_versioned_bucket_arn" {
    value = "${module.non_versioned_bucket.s3_bucket_arn}"
}
