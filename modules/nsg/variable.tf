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

variable "subnetid1" {
  description = "filled in module"
}

variable "subnetid2" {
  description = "filled in module"
}

variable "resourcename" {
  description = "filled in module"
}

variable "ports" {
    type = list(string)
  description = "list of ports"
  default     = ["3389", "80" ]
}
