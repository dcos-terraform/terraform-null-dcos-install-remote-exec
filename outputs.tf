output "depends" {
  description = "Modules are missing the depends_on feature. Faking this feature with input and output variables"

  # value       = "${module.dcos-install.depends}"
  value = ""
}

output "config" {
  description = "The battle-tested provisioner contents of the output by DC/OS role to perform requried admin actions in behalf of the user as documented in http://mesosphere.com and http://dcos.io"
  value       = "${module.dcos-core.config}"
}
