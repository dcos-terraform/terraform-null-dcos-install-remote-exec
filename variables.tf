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

variable "bootstrap_ssh_private_key" {
  default     = ""
  description = "SSH Private key to be used ( default use SSH_Agent)"
}

variable "master_ips" {
  type        = list(string)
  description = "List of masterips to SSH to"
}

variable "master_private_ips" {
  type        = list(string)
  description = "list of master private ips"
}

variable "masters_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for masters )"
}

variable "private_agent_ips" {
  type        = list(string)
  description = "List of private agent IPs to SSH to"
}

variable "private_agents_os_user" {
  default     = ""
  description = "The OS user to be used with ssh exec ( only for private agents )"
}

variable "public_agent_ips" {
  type        = list(string)
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
  type        = list(string)
  description = "List of private agent IPs to SSH to"
}

variable "public_agent_private_ips" {
  type        = list(string)
  description = "List of public agent IPs to SSH to"
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

variable "dcos_download_url_checksum" {
  description = "Custom DC/OS download URL SHA256 Checksum. Empty string omits checking."
  default     = ""
}

variable "adminrouter_grpc_proxy_port" {
  description = ""
  default     = 12379
}
