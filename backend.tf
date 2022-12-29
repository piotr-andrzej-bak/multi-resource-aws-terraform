terraform {
  backend "s3" {
    bucket = "terra-state-eu381"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}
