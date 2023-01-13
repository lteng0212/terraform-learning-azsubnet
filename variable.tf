variable "private_subnet_cidrs" {
  type = list(string)
  default = {
    staging    = ["10.1.0.0/16"]
    production = ["10.2.0.0/16"]
  }
}

variable "private_subnet_name" {
  type = string
  default = {
    staging    = "myTFStageVnet"
    production = "myTFProdVnet"
  }
}

variable "rg_name" {
  type = string
  default = {
    staging    = "myTFStageResourceGroup"
    production = "myTFProdResourceGroup"
  }
}

variable "state_name" {
  type = string
  default = {
    staging    = "ltazstagesub.tfstate"
    production = "ltazprodsub.tfstate"
  }
}