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

variable "bootstrap_prereq-id" {
  description = "Workaround making the bootstrap install depending on an external resource (e.g. nullresource.id)"
  default     = ""
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

variable "masters_prereq-id" {
  description = "Workaround making the masters install depending on an external resource (e.g. nullresource.id)"
  default     = ""
}

variable "private_agent_ips" {
  type        = "list"
  description = "list of master private ips"
}

variable "private_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for private agents )"
}

variable "private_agents_prereq-id" {
  description = "Workaround making the private agent install depending on an external resource (e.g. nullresource.id)"
  default     = ""
}

variable "public_agent_ips" {
  type        = "list"
  description = "list of master private ips"
}

variable "public_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for public agents )"
}

variable "public_agents_prereq-id" {
  description = "Workaround making the public agent install depending on an external resource (e.g. nullresource.id)"
  default     = ""
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
