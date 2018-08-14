variable "os_user" {
  default     = "centos"
  description = "The OS user to be used with ssh exec"
}

variable "bootstrap_ip" {
  description = "the bootstrap ip to ssh to"
}

variable "bootstrap_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for bootstrap )"
}

variable "master_ips" {
  type        = "list"
  description = "list of master ips"
}

variable "master_private_ips" {
  type        = "list"
  description = "list of master private ips"
}

variable "masters_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for masters )"
}

variable "private_agent_ips" {
  type        = "list"
  description = "list of master private ips"
}

variable "private_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for private agents )"
}

variable "public_agent_ips" {
  type        = "list"
  description = "list of master private ips"
}

variable "public_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for public agents )"
}

variable "num_masters" {
  description = "Specify the amount of masters."
}

variable "num_private_agents" {
  description = "Specify the amount of private agents."
}

variable "num_public_agents" {
  description = "Specify the amount of public agents."
}
