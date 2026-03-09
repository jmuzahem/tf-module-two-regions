provider "aws" {
  profile = "hashi_aws"
  alias   = "east"
  region  = "us-east-1"
}

provider "aws" {
  profile = "hashi_aws"
  alias   = "west"
  region  = "us-west-2"
}

module "bucket_east" {
  source = "./modules/bucket"

  providers = {
    aws = aws.east
  }

  bucket_name = "my-east-bucket-123456789"
}

module "bucket_west" {
  source = "./modules/bucket"

  providers = {
    aws = aws.west
  }

  bucket_name = "my-west-bucket-123456789"
}
