/******************************************
  Project creation
*****************************************/

module "organization_networking_hub" {
  source                      = "terraform-google-modules/project-factory/google"
  version                     = "~> 11.1"
  random_project_id           = "true"
  default_service_account     = "deprivilege"
  name                        = var.infra_networking_hub_project.name
  org_id                      = var.organization_id
  billing_account             = var.billing_account
  folder_id                   = google_folder.infra.id
  activate_apis               = [
    "compute.googleapis.com",
    "dns.googleapis.com",
    "servicenetworking.googleapis.com",
    "logging.googleapis.com",
    "cloudresourcemanager.googleapis.com",
    "billingbudgets.googleapis.com"
  ]
  budget_alert_pubsub_topic   = var.budget_alert_pubsub_topic
  budget_alert_spent_percents = var.budget_alert_spent_percents
  budget_amount               = var.infra_networking_hub_project.budget.amount

  labels = {
    environment_code       = "prod"
    application_name  = var.infra_networking_hub_project.name
  }
}
