variable "subnet_id" {
  type        = string
  default     = ""
  description = "id da VPC"
}

variable "ec2_id" {
  type        = string
  default     = ""
  description = "id da ec2"
}

variable "lb_tags" {
  type        = map(string)
  default     = {}
  description = "tags de criação"
}

variable "security_group_id" {
  type        = string
  description = "ID of the security group for the Load Balancer"
}

variable "vpc_id" {
  type        = string
  description = "ID of the security group for the Load Balancer"
}