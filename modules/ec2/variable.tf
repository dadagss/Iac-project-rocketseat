variable "ec2_instance_name" {
  type        = string
  default     = ""
  description = "nome da instancia"
}

variable "subnet_id" {
  type        = string
  default     = ""
  description = "id da subnet"
}

variable "ec2_tags" {
  type        = map(string)
  default     = {}
  description = "tags de criação"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "tipo de instancia"
}

