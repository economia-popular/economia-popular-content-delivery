variable "project_name" {
  default = "economia-popular-delivery-content"
}

variable "region" {
  default = "us-east-1"
}

variable "default_tags" {
  type = map(any)
  default = {
    "Project" = "EconomiaPopular"
    "Feature" = "ContentDelivery"
  }
}