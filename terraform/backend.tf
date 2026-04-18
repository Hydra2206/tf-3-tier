terraform {
  backend "s3" {
    bucket         = "s3-backend-bket"
    key            = "s3-backend-bket/terraform.tfstate"
    region         = "ap-south-1"
    use_lockfile = true
  }
}
