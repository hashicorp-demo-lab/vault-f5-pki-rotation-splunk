// generic outputs

output "deployment_id" {
  description = "Deployment identifier"
  value       = local.deployment_id
}

// amazon web services (aws) outputs

output "aws_bastion_public_fqdn" {
  description = "AWS public fqdn of bastion node"
  value       = module.infra-aws.bastion_public_fqdn
}

// hashiCorp cloud platform (hcp) outputs

output "hcp_vault_admin_token" {
  description = "HCP vault admin token"
  value       = module.hcp-vault.admin_token
  sensitive   = true
}

output "hcp_vault_public_fqdn" {
  description = "HCP vault public fqdn"
  value       = module.hcp-vault.public_endpoint_url
}

#F5 outputs

output "f5_mgmtPublicIP" {
  description = "F5 management IP"
  value       = module.bigip.mgmtPublicIP
}

output "f5_mgmtPublicDNS" {
  description = "F5 management IP"
  value       = module.bigip.mgmtPublicDNS
}

output "f5_username" {
  description = "F5 management IP"
  value       = module.bigip.f5_username
}

output "f5_bigip_password" {
  description = "F5 management IP"
  value       = module.bigip.bigip_password
}