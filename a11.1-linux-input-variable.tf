variable "web_linux_instance_count" {
  description = "Web Linux instance count"
  type = map(string)
  default = {
    "vm1" = "1022",
    "vm2" = "2022"
  }
}