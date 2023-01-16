keycloak_url                      = "https://auth.company.local"
keycloak_realm                    = "cloud-public"
keycloak_client_id                = "terraform"
keycloak_ldap_bind_dn             = "CN=INFRAGP_COCKPIT_ASV,OU=ASV,OU=Prive,OU=Composants_Systeme,OU=RESSOURCES,DC=intra,DC=${var.company_name},DC=local"
keycloak_ldap_bind_credential     = ""
keycloak_ldap_server_url          = "ldaps://intra.company.local"
keycloak_ldap_users_dn            = "DC=intra,DC=${var.company_name},DC=local"
keycloak_ldap_roles_mapper_dn     = "OU=Utilisateurs,OU=UA2146,OU=METIER15,OU=Siege,DC=intra,DC=${var.company_name},DC=local"
keycloak_ldap_roles_mapper_name   = "ARCOS CERT Blue Team"
keycloak_ldap_roles_mapper_filter = "(CN=FU_UA2146_CERT_BT)"

#DO NOT DELETE : This file must end with a new line

gcp_organization_id              = "983256491121"
gcp_organization_name            = "company.cloud"
gcp_billing_account              = "01A47A-F9BAF1-1EE048"
gcp_workspace_customer_id        = "C03sciyt9"
##################################### Terraform SA ###################
gcp_terraform_sa_email           = "landing-zone-automation@shared-services-340608.iam.gserviceaccount.com"
gcp_terraform_sa_id              = "projects/shared-services-340608/serviceAccounts/landing-zone-automation@shared-services-340608.iam.gserviceaccount.com"
gcp_group_org_admins             = "gcp-organization-admins@company.cloud"
gcp_group_org_security_admins    = "gcp-security-admins@company.cloud"
gcp_group_org_security_reviewers = "gcp-security-reviewers@company.cloud"
gcp_group_org_billing_admins     = "gcp-billing-admins@company.cloud"
gcp_group_org_viewers            = "gcp-organization-viewers@company.cloud"
gcp_group_org_network_admins     = "gcp-network-admins@company.cloud"
gcp_group_org_network_viewers    = "gcp-network-viewers@company.cloud"

gcp_iam_groups = {
  gcp-developers           = {
    name     = "gcp-developers"
    folders  = null
    projects = null
    roles    = []
    members  = []
    managers = []
  }
  gcp-security-admins      = {
    name     = "gcp-security-admins"
    folders  = null
    projects = null
    roles    = ["roles/securitycenter.admin"]
    members  = []
    managers = []
  }
  gcp-security-reviewers   = {
    name     = "gcp-security-reviewers"
    folders  = null
    projects = null
    roles    = ["roles/securitycenter.adminViewer"]
    members  = []
    managers = []
  }
  gcp-billing-admins       = {
    name     = "gcp-billing-admins"
    folders  = null
    projects = null
    roles    = ["roles/billing.admin"]
    members  = []
    managers = []
  }
  gcp-organization-viewers = {
    name     = "gcp-organization-viewers"
    roles    = ["roles/resourcemanager.organizationViewer", "roles/viewer"]
    folders  = null
    projects = null
    members  = ["i2146et", "i2146en", "y850170", "b846378", "i2146dm", "e822484", "p837673", "c833476"]
    managers = []
  }
  gcp-network-admins       = {
    name     = "gcp-network-admins"
    folders  = null
    projects = null
    roles    = []
    members  = []
    managers = []
  }
  gcp-network-viewers      = {
    name     = "gcp-network-viewers"
    folders  = null
    projects = null
    roles    = []
    members  = ["i2118j8"]
    managers = []
  }

  landing-zone-admins = {
    name     = "landing-zone-admins"
    folders  = null
    projects = null
    roles    = [
      "roles/compute.admin", "roles/container.admin", "roles/storage.admin", "roles/compute.osAdminLogin",
      "roles/securitycenter.notificationConfigEditor","roles/monitoring.admin"
    ]
    members  = []
    managers = ["i21189z", "i2118j8"]
  }

  exp-environment-devops = {
    name     = "exp-environment-devops"
    folders  = null
    projects = ["exp-shared-services"]
    roles    = ["roles/viewer","roles/compute.osAdminLogin"]
    members  = [
      "i2118m1", "i21186e", "i21188e", "t821093", "i21189y", "i21189z", "i2118j8","s822794","i21390c"
    ]
    managers = []
  }

  dev-environment-devops = {
    name     = "dev-environment-devops"
    folders  = null
    projects = ["dev-shared-services"]
    roles    = ["roles/viewer","roles/compute.osAdminLogin"]
    members  = [
      "d824277", "i2118j8", "i21189z","i2118br", "u814378"
    ]
    managers = []
  }

  uc1-project-viewer = {
    name     = "uc1-project-viewer"
    folders  = null
    projects = ["exp-uc1-kube"]
    roles    = ["roles/viewer"]
    members  = [
      "i2118m1", "i21186e", "i21188e", "t821093", "i21189y", "i21189z", "i2118j8", "b846378", "c833476", "i213908",
      "b856567", "d824277", "i2118bg", "v829881", "y850170", "i2146et", "i2146en", "i21180b", "i21180c",
      "i21180h", "i2134da", "i2146dm", "i2146fb", "e822484", "i2162kd", "p837673", "s822794"
    ]
    managers = []
  }

  uc2-project-viewer = {
    name     = "uc2-project-viewer"
    folders  = null
    projects = ["exp-uc2-ml-ia"]
    roles    = ["roles/viewer"]
    members  = [
      "i2118m1", "i21186e", "i21188e", "t821093", "i21189y", "i21189z", "i2118j8", "b846378", "c833476", "i213908",
      "b856567", "d824277", "i2118bg", "v829881", "y850170", "i2146et", "i2146en", "i21180b", "i21180c",
      "i21180h", "i2134da", "i2146dm", "i2146fb", "e822484", "i2162kd", "p837673", "s822794"
    ]
    managers = []
  }

  uc3-project-viewer = {
    name     = "uc3-project-viewer"
    folders  = null
    projects = ["dev-uc3-catalyse"]
    roles    = ["roles/viewer"]
    members  = [
      "i2118m1", "i21186e", "i21188e", "t821093", "i21189y", "i21189z", "i2118j8", "b846378", "c833476", "i213908",
      "b856567", "d824277", "i2118bg", "v829881", "y850170", "i2146et", "i2146en", "i21180b", "i21180c",
      "i21180h", "i2134da", "i2146dm", "i2146fb", "e822484", "i2162kd", "p837673", "s822794","i2118br", "u814378"
    ]
    managers = []
  }

  uc1-project-devops = {
    name     = "uc1-project-devops"
    folders  = null
    projects = ["exp-uc1-kube"]
    roles    = [
      "roles/cloudsql.admin", "roles/container.clusterAdmin", "roles/storage.admin", "roles/artifactregistry.admin",
      "roles/iam.serviceAccountUser", "roles/compute.networkUser",
      "roles/container.developer","roles/iam.serviceAccountTokenCreator"
    ]
    members = [
      "i21188e", "i2118m1", "i21186e", "i21189y", "t821093"
    ]
    managers  = []
  }

  uc2-project-devops = {
    name     = "uc2-project-devops"
    folders  = null
    projects = ["exp-uc2-ml-ia"]
    roles    = [
      "roles/compute.instanceAdmin.v1", "roles/storage.admin", "roles/ml.admin", "roles/iam.serviceAccountUser",
      "roles/compute.networkUser","roles/iam.serviceAccountTokenCreator"
    ]
    members = [
      "i21188e", "i2118m1", "i21186e", "i21189y", "t821093", "s822794"
    ]
    managers  = []
  }

  uc3-project-devops = {
    name     = "uc3-project-devops"
    folders  = null
    projects = ["dev-uc3-catalyse"]
    roles    = ["roles/compute.admin"]
    members  = [
      "i21188e", "i2118m1", "i21186e", "i21189y", "t821093","i2118br", "u814378"
    ]
    managers = []
  }
}