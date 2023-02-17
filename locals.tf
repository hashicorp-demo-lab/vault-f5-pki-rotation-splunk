locals {
  publicSubnet          = tolist(module.infra-aws.public_subnet_ids)[0]
  hcp_vault_public_fqdn = module.hcp-vault.public_endpoint_url
  vault_token           = module.hcp-vault.admin_token
}