variable "os_user" {
  default     = "centos"
  description = "The OS user to be used"
}

variable "bootstrap_ip" {
  description = "The bootstrap IP to SSH to"
}

variable "bootstrap_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec (only for bootstrap)"
}

variable "master_ips" {
  type        = "list"
  description = "List of masterips to SSH to"
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
  description = "List of private agent IPs to SSH to"
}

variable "private_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for private agents )"
}

variable "public_agent_ips" {
  type        = "list"
  description = "List of public agent IPs to SSH to"
}

variable "public_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec (only for public agents)"
}

variable "num_masters" {
  description = "Specify the amount of masters. For redundancy you should have at least 3"
}

variable "num_private_agents" {
  description = "Specify the amount of private agents. These agents will provide your main resources"
}

variable "num_public_agents" {
  description = "Specify the amount of public agents. These agents will host marathon-lb and edgelb"
}

variable "private_agent_private_ips" {
  type        = "list"
  description = "List of private agent IPs to SSH to"
}

variable "public_agent_private_ips" {
  type        = "list"
  description = "List of public agent IPs to SSH to"
}

variable "windows_private_agent_private_ips" {
  default     = []
  description = "List of private windows agent IPs to WinRM to"
}

variable "windows_private_agent_passwords" {
  default     = []
  description = "List of private windows agent passwords to be used for WinRM"
}

variable "windows_private_agent_username" {
  default     = "Administrator"
  description = "Username for the WinRM connection"
}

variable "ansible_winrm_transport" {
  default     = "basic"
  description = "Authentication type for WinRM"
}

variable "ansible_winrm_server_cert_validation" {
  default     = "ignore"
  description = "Validation setting for the target WinRM connection certificate"
}

variable "ansible_bundled_container" {
  default     = "mesosphere/dcos-ansible-bundle:latest"
  description = "Docker container with bundled dcos-ansible and ansible executables"
}

variable "ansible_additional_config" {
  default     = ""
  description = "Add additional config options to ansible. This is getting merged with generated defaults. Do not specify `dcos:`"
}

variable "ansible_force_run" {
  default     = false
  description = "Run Ansible on every Terraform apply"
}
