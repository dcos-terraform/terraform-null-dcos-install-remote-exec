output "depends" {
  description = "Modules are missing the depends_on feature. Faking this feature with input and output variables"
  value       = "${module.dcos-bootstrap-install.depends},${module.dcos-masters-install.depends},${module.dcos-private-agents-install.depends},${module.dcos-public-agents-install.depends}"
}
