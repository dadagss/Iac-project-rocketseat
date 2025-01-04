variable "vpc_id" {
  type        = string
  description = "ID da VPC"
}

variable "sg_tags" {
  type        = map(string)
  description = "Tags para o Security Group"
}
