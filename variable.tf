variable "private_subnet_cidrs" {
  type = list(string)
  default =  ["10.0.0.0/16"]
}

variable "private_subnet_name" {
  type = string
  default = "myTFVnet"
}

variable "rg_name" {
  type = string
  default  = "myTFResourceGroup"
}
