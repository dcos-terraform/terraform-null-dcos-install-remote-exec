output "depends" {
  description = "Modules are missing the depends_on feature. Faking this feature with input and output variables"

  # value       = "${module.dcos-install.depends}"
  value = ""
}
