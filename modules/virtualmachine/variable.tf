variable "prefix" {
  description = "name of resource"
  default     = "kube"
}

variable "environmentlocation" {
  description = "filled in module"
}

variable "environmentname" {
  description = "filled in module"
}

variable "vm_username1" {
  description = "username of VM"
  default = "mevirtual"
}

variable "vm_username2" {
  description = "username of VM"
  default = "mevirtual"
}

variable "vm_password" {
  description = "username of VM"
  default = "Password44$"
}

variable "networkinterface1" {
  description = "filled in module"
}

variable "networkinterface2" {
  description = "filled in module"
}

variable "resourcename" {
  description = "filled in module"
}

# variable "num" {
#     type = list(string)
#   description = "list of VM"
#   default     = ["master", "worker" ]
# }