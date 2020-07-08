/**
 * DC/OS remote exec install
 * ============
 * This module installs all DC/OS node types
 *
 * EXAMPLE
 * -------
 * ```hcl
 *  module "dcos-install" {
 *   source = "dcos-terraform/dcos-install-remote-exec/null"
 *   version = "~> 0.2.0"
 *   bootstrap_ip         = "${module.dcos-infrastructure.bootstrap.public_ip}"
 *   bootstrap_private_ip = "${module.dcos-infrastructure.bootstrap.private_ip}"
 *   bootstrap_os_user    = "${module.dcos-infrastructure.bootstrap.os_user}"
 *
 *   master_ips         = ["${module.dcos-infrastructure.masters.public_ips}"]
 *   master_private_ips = ["${module.dcos-infrastructure.masters.private_ips}"]
 *   masters_os_user    = "${module.dcos-infrastructure.masters.os_user}"
 *   num_masters        = "${var.num_masters}"
 *
 *   private_agent_ips         = ["${module.dcos-infrastructure.private_agents.public_ips}"]
 *   private_agent_private_ips = ["${module.dcos-infrastructure.private_agents.private_ips}"]
 *   private_agents_os_user    = "${module.dcos-infrastructure.private_agents.os_user}"
 *   num_private_agents        = "${var.num_private_agents}"
 *
 *   public_agent_ips         = ["${module.dcos-infrastructure.public_agents.public_ips}"]
 *   public_agent_private_ips = ["${module.dcos-infrastructure.public_agents.private_ips}"]
 *   public_agents_os_user    = "${module.dcos-infrastructure.public_agents.os_user}"
 *   num_public_agents        = "${var.num_public_agents}"
 *
 *   dcos_cluster_name = "${var.cluster_name}"
 *   dcos_version      = "${var.dcos_version}"
 *
 *   dcos_ip_detect_public_contents = <<EOF
 * #!/bin/sh
 * set -o nounset -o errexit
 *
 * curl -fsSL http://whatismyip.akamai.com/
 * EOF
 *   dcos_ip_detect_contents = <<EOF
 * #!/bin/sh
 * # Example ip-detect script using an external authority
 * # Uses the AWS Metadata Service to get the node's internal
 * # ipv4 address
 * curl -fsSL http://169.254.169.254/latest/meta-data/local-ipv4
 * EOF
 *   dcos_fault_domain_detect_contents = <<EOF
 * #!/bin/sh
 * set -o nounset -o errexit
 *
 * METADATA="$(curl http://169.254.169.254/latest/dynamic/instance-identity/document 2>/dev/null)"
 * REGION=$(echo $METADATA | grep -Po "\"region\"\s+:\s+\"(.*?)\"" | cut -f2 -d:)
 * ZONE=$(echo $METADATA | grep -Po "\"availabilityZone\"\s+:\s+\"(.*?)\"" | cut -f2 -d:)
 *
 * echo "{\"fault_domain\":{\"region\":{\"name\": $REGION},\"zone\":{\"name\": $ZONE}}}"
 * EOF
 *   dcos_variant                      = "ee"
 *   dcos_license_key_contents      = ""
 *   dcos_master_discovery          = "static"
 *   dcos_exhibitor_storage_backend = "static"
 * }
 * ```
 */

module "dcos-core" {
  source  = "dcos-terraform/dcos-core/template"
  version = "~> 0.3.0"

  bootstrap_private_ip                         = var.bootstrap_private_ip
  dcos_num_masters                             = var.num_masters
  custom_dcos_download_path                    = var.custom_dcos_download_path
  dcos_adminrouter_tls_1_0_enabled             = var.dcos_adminrouter_tls_1_0_enabled
  dcos_adminrouter_tls_1_1_enabled             = var.dcos_adminrouter_tls_1_1_enabled
  dcos_adminrouter_tls_1_2_enabled             = var.dcos_adminrouter_tls_1_2_enabled
  dcos_adminrouter_tls_cipher_suite            = var.dcos_adminrouter_tls_cipher_suite
  dcos_agent_list                              = var.dcos_agent_list
  dcos_audit_logging                           = var.dcos_audit_logging
  dcos_auth_cookie_secure_flag                 = var.dcos_auth_cookie_secure_flag
  dcos_aws_access_key_id                       = var.dcos_aws_access_key_id
  dcos_aws_region                              = var.dcos_aws_region
  dcos_aws_secret_access_key                   = var.dcos_aws_secret_access_key
  dcos_aws_template_storage_access_key_id      = var.dcos_aws_template_storage_access_key_id
  dcos_aws_template_storage_bucket             = var.dcos_aws_template_storage_bucket
  dcos_aws_template_storage_bucket_path        = var.dcos_aws_template_storage_bucket_path
  dcos_aws_template_storage_region_name        = var.dcos_aws_template_storage_region_name
  dcos_aws_template_storage_secret_access_key  = var.dcos_aws_template_storage_secret_access_key
  dcos_aws_template_upload                     = var.dcos_aws_template_upload
  dcos_bootstrap_port                          = var.dcos_bootstrap_port
  dcos_bouncer_expiration_auth_token_days      = var.dcos_bouncer_expiration_auth_token_days
  dcos_ca_certificate_chain_path               = var.dcos_ca_certificate_chain_path
  dcos_ca_certificate_key_path                 = var.dcos_ca_certificate_key_path
  dcos_ca_certificate_path                     = var.dcos_ca_certificate_path
  dcos_calico_network_cidr                     = var.dcos_calico_network_cidr
  dcos_calico_vxlan_enabled                    = var.dcos_calico_vxlan_enabled
  dcos_calico_vxlan_port                       = var.dcos_calico_vxlan_port
  dcos_calico_ipinip_mtu                       = var.dcos_calico_ipinip_mtu
  dcos_calico_vxlan_mtu                        = var.dcos_calico_vxlan_mtu
  dcos_calico_vxlan_vni                        = var.dcos_calico_vxlan_vni
  dcos_calico_veth_mtu                         = var.dcos_calico_veth_mtu
  dcos_check_time                              = var.dcos_check_time
  dcos_cluster_docker_credentials              = var.dcos_cluster_docker_credentials
  dcos_cluster_docker_credentials_dcos_owned   = var.dcos_cluster_docker_credentials_dcos_owned
  dcos_cluster_docker_credentials_enabled      = var.dcos_cluster_docker_credentials_enabled
  dcos_cluster_docker_credentials_write_to_etc = var.dcos_cluster_docker_credentials_write_to_etc
  dcos_cluster_docker_registry_enabled         = var.dcos_cluster_docker_registry_enabled
  dcos_cluster_docker_registry_url             = var.dcos_cluster_docker_registry_url
  dcos_cluster_name                            = var.dcos_cluster_name
  dcos_config                                  = var.dcos_config
  dcos_custom_checks                           = var.dcos_custom_checks
  dcos_customer_key                            = var.dcos_customer_key
  dcos_dns_bind_ip_blacklist                   = var.dcos_dns_bind_ip_blacklist
  dcos_dns_forward_zones                       = var.dcos_dns_forward_zones
  dcos_dns_search                              = var.dcos_dns_search
  dcos_docker_remove_delay                     = var.dcos_docker_remove_delay
  dcos_enable_docker_gc                        = var.dcos_enable_docker_gc
  dcos_enable_gpu_isolation                    = var.dcos_enable_gpu_isolation
  dcos_exhibitor_address                       = var.dcos_exhibitor_address
  dcos_exhibitor_azure_account_key             = var.dcos_exhibitor_azure_account_key
  dcos_exhibitor_azure_account_name            = var.dcos_exhibitor_azure_account_name
  dcos_exhibitor_azure_prefix                  = var.dcos_exhibitor_azure_prefix
  dcos_exhibitor_explicit_keys                 = var.dcos_exhibitor_explicit_keys
  dcos_exhibitor_storage_backend               = var.dcos_exhibitor_storage_backend
  dcos_exhibitor_zk_hosts                      = var.dcos_exhibitor_zk_hosts
  dcos_exhibitor_zk_path                       = var.dcos_exhibitor_zk_path
  dcos_fault_domain_enabled                    = var.dcos_fault_domain_enabled
  dcos_gc_delay                                = var.dcos_gc_delay
  dcos_gpus_are_scarce                         = var.dcos_gpus_are_scarce
  dcos_http_proxy                              = var.dcos_http_proxy
  dcos_https_proxy                             = var.dcos_https_proxy
  dcos_ip_detect_public_filename               = var.dcos_ip_detect_public_filename
  dcos_l4lb_enable_ipv6                        = var.dcos_l4lb_enable_ipv6
  dcos_license_key_contents                    = var.dcos_license_key_contents
  dcos_log_directory                           = var.dcos_log_directory
  dcos_master_discovery                        = var.dcos_master_discovery
  dcos_master_list                             = var.master_private_ips
  dcos_master_dns_bindall                      = var.dcos_master_dns_bindall
  dcos_master_external_loadbalancer            = var.dcos_master_external_loadbalancer
  dcos_mesos_container_log_sink                = var.dcos_mesos_container_log_sink
  dcos_mesos_dns_set_truncate_bit              = var.dcos_mesos_dns_set_truncate_bit
  dcos_mesos_max_completed_tasks_per_framework = var.dcos_mesos_max_completed_tasks_per_framework
  dcos_no_proxy                                = var.dcos_no_proxy
  dcos_oauth_enabled                           = var.dcos_oauth_enabled
  dcos_overlay_config_attempts                 = var.dcos_overlay_config_attempts
  dcos_overlay_enable                          = var.dcos_overlay_enable
  dcos_overlay_mtu                             = var.dcos_overlay_mtu
  dcos_overlay_network                         = var.dcos_overlay_network
  dcos_package_storage_uri                     = var.dcos_package_storage_uri
  dcos_previous_version                        = var.dcos_previous_version
  dcos_previous_version_master_index           = var.dcos_previous_version_master_index
  dcos_process_timeout                         = var.dcos_process_timeout
  dcos_public_agent_list                       = var.dcos_public_agent_list
  dcos_resolvers                               = var.dcos_resolvers
  dcos_rexray_config                           = var.dcos_rexray_config
  dcos_rexray_config_filename                  = var.dcos_rexray_config_filename
  dcos_rexray_config_method                    = var.dcos_rexray_config_method
  dcos_s3_bucket                               = var.dcos_s3_bucket
  dcos_s3_prefix                               = var.dcos_s3_prefix
  dcos_security                                = var.dcos_security
  dcos_skip_checks                             = var.dcos_skip_checks
  dcos_staged_package_storage_uri              = var.dcos_staged_package_storage_uri
  dcos_superuser_password_hash                 = var.dcos_superuser_password_hash
  dcos_superuser_username                      = var.dcos_superuser_username
  dcos_telemetry_enabled                       = var.dcos_telemetry_enabled
  dcos_variant                                 = var.dcos_variant
  dcos_ucr_default_bridge_subnet               = var.dcos_ucr_default_bridge_subnet
  dcos_use_proxy                               = var.dcos_use_proxy
  dcos_version                                 = var.dcos_version
  dcos_versions_service_url                    = var.dcos_versions_service_url
  dcos_zk_agent_credentials                    = var.dcos_zk_agent_credentials
  dcos_fault_domain_detect_contents            = var.dcos_fault_domain_detect_contents
  dcos_ip_detect_contents                      = var.dcos_ip_detect_contents
  dcos_ip_detect_public_contents               = var.dcos_ip_detect_public_contents
  dcos_enable_mesos_input_plugin               = var.dcos_enable_mesos_input_plugin
  adminrouter_grpc_proxy_port                  = var.adminrouter_grpc_proxy_port
}

module "dcos-install" {
  source  = "dcos-terraform/dcos-install-remote-exec-ansible/null"
  version = "~> 0.3.1"

  bootstrap_ip              = var.bootstrap_ip
  bootstrap_private_ip      = var.bootstrap_private_ip
  bootstrap_os_user         = var.bootstrap_os_user
  master_private_ips        = var.master_private_ips
  private_agent_private_ips = var.private_agent_private_ips
  public_agent_private_ips  = var.public_agent_private_ips
  dcos_download_url         = module.dcos-core.download_url
  bootstrap_ssh_private_key = var.bootstrap_ssh_private_key
  dcos_download_url_checksum = coalesce(
    var.dcos_download_url_checksum,
    module.dcos-core.download_url_checksum,
  )
  dcos_version              = module.dcos-core.version
  dcos_image_commit         = var.dcos_image_commit
  dcos_variant              = var.dcos_variant
  dcos_config_yml           = module.dcos-core.config
  ansible_bundled_container = var.ansible_bundled_container
  ansible_additional_config = var.ansible_additional_config
  ansible_force_run         = var.ansible_force_run
}
