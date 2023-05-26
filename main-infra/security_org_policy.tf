module "orga_policies" {
  source        = "../modules/gcp_orga_policies"
  resource_id   = var.gcp_parent_container_id
  resource_type = startswith("organization", var.gcp_parent_container_id) ? "organization" : "folder"

  domains_to_allow = [
    var.gcp_organization_domain
  ]
  skip_default_network_policy = true

}