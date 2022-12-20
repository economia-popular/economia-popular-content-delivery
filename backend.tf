terraform {
  backend "s3" {
    bucket = "nanoshots-tfstates"
    key    = "economia-popular-delivery-content"
    region = "us-east-1"
  }
}