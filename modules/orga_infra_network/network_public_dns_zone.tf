/******************************************
 DNS Public
*****************************************/

module "dns-public-zone" {
  source  = "terraform-google-modules/cloud-dns/google"
  version = "~> 4.2"

  project_id = local.org_nethub_project_id
  type       = "public"
  #[prefix]-[resource]-[location]-[description]-[suffix]
  name       = "${var.prefix}-fz-glob"
  domain     = "${var.domain}."

}