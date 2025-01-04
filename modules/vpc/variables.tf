variable "vpc_instance_name" {
  type        = string
  default     = ""
  description = "nome da instancia"
}

variable "Region" {
  type    = string
  default = "us-east-1a"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr da vpc"
}

variable "vpc_tags" {
  type        = map(string)
  default     = {}
  description = "tags de criação"
}