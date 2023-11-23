variable "rg_name" {
  type = string
  validation {
    condition = length(var.rg_name) > 5 //&& substr(var.rg_name,0,4) == "dev-"
    error_message = "it was not having length of 6 min or environment name is not in the start"
  }
}

variable "location" {
  type = string
  default = "eastus"
}

variable "storage_name" {
  type = string
}