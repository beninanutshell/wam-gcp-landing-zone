/******************************************
  Fetch data
*****************************************/

module "fetch" {
  source = "../modules/shared/gcp_fetch_organization"

  organization_id = var.gcp_organization_id
}

/******************************************
  Create business projects
*****************************************/

module "business_project" {

  for_each = local.business_projects_map

  source                                   = "../modules/gcp_orga_business_project"
  billing_account                          = var.gcp_billing_account
  environment_code                         = each.value.environment_code
  org_id                                   = var.gcp_organization_id
  project_name                             = "${each.value.environment_code}-${each.value.name}"
  terraform_service_account                = var.gcp_terraform_sa_email
  env_network_hub_project_id               = module.fetch.network_hubs_by_env_code[each.value.environment_code].project_id
  env_network_hub_vpc_subnetwork_self_link = [
  for self_link in module.fetch.network_hubs_shared_vpc_by_env_code[each.value.environment_code].subnetworks_self_links :
  self_link if length(regexall("${each.value.environment_code}-${each.value.name}-.*", self_link)) > 0
  ]
  parent_folder_id                         = module.fetch.folders_by_env_code[each.value.environment_code][each.value.department].name
  activate_apis                            = [
    "iam.googleapis.com",
    "compute.googleapis.com",
    "container.googleapis.com",
    "networkmanagement.googleapis.com",
    "artifactregistry.googleapis.com",
    "sqladmin.googleapis.com"
  ]
  monitoring_project_id = module.fetch.projects_by_name[var.gcp_infra_projects.observability.name].project_id

  depends_on = [
    module.fetch
  ]
}