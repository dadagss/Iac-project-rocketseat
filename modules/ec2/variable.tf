variable "ec2_instance_name" {
  type        = string
  default     = ""
  description = "nome da instancia"
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "id da VPC"
}

variable "ec2_tags" {
  type        = map(string)
  default     = {}
  description = "tags de criação"
}