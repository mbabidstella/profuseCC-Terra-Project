variable "ami" {
  description = "expecting value for ami # Note ami miust be from us-east-1"
  type = string
  # default = "ami-02396cdd13e9a1257"
  sensitive = false
}

variable "instance_type" {
  description = "instance types expected"
  type = list
  default = ["t2.small", "t2.large", "t3.nano", "t4.large"]
  sensitive = false
}


variable "associate_public_ip_address" {
  description = ""
  type = bool
  default = true
  sensitive = false
}

variable "tags" {
  description = ""
  type = map
  default = {
    Name = "jjtech-server"
    Environment = "dev"
    Project = "tower-project"
  }
  sensitive = false
}


variable "number_of_instance" {
  description = ""
  type = number
  default = 3
  sensitive = false
}
