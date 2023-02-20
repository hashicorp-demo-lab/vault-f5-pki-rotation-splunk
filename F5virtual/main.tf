


#LTM Pool and node attachment
resource "bigip_ltm_pool" "pool" {
  name                = "/Common/${var.app_prefix}-pool"
  load_balancing_mode = "round-robin"
  monitors            = []
  allow_snat          = "yes"
  allow_nat           = "yes"
}

resource "bigip_ltm_node" "node" {
  for_each = toset(var.node_list)
  name    = "/Common/${each.value}"
  address = each.value
}

resource "bigip_ltm_pool_attachment" "attach_node" {
  for_each = bigip_ltm_node.node
  pool = bigip_ltm_pool.pool.name
  node = "${bigip_ltm_node.node[each.key].name}:80"
}


# Create F5 virtual server
resource "bigip_ltm_virtual_server" "https" {
  name = "/Common/${var.app_prefix}-vs_https"
  destination = "${var.vip_ip}"
  port = 443
  pool = bigip_ltm_pool.pool.name
  profiles = []
  source_address_translation = "automap"
} 



/* 
# Create F5 SSL certificate from Vault
resource "f5_ssl_certificate" "myapp" {
  name          = "myapp_ssl_certificate"
  content       = "${data.vault_generic_secret.ssl_cert.data.certificate}"
  key           = "${data.vault_generic_secret.ssl_cert.data.private_key}"
  intermediates = ["${data.vault_generic_secret.ssl_cert.data.intermediate_cert}"]
}

 */