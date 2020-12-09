#variable "default_tags"{
#    type        = map(string)
#    description = "adcox3-bucket-tag"
#}

variable "bucket_name" {
  type        = string
  default = "adcox9"
}

variable "versioning" {
  default = true
}