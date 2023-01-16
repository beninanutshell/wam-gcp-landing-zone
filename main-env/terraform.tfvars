gcp_organization_id     = "983256491121"
gcp_organization_name   = "company.cloud"
gcp_billing_account     = "01A47A-F9BAF1-1EE048"
gcp_default_region1     = "europe-west4"
gcp_default_region1_azs = [
  "europe-west4-a",
  "europe-west4-b",
  "europe-west4-c"
]
gcp_default_region2     = "europe-north1"
gcp_default_region2_azs = [
  "europe-north1-b",
  "europe-north1-c",
  "europe-north1-d"
]

##################################### Terraform SA ###################
gcp_terraform_sa_email           = "landing-zone-automation@shared-services-340608.iam.gserviceaccount.com"
gcp_terraform_sa_id              = "projects/shared-services-340608/serviceAccounts/landing-zone-automation@shared-services-340608.iam.gserviceaccount.com"
gcp_group_org_admins             = "gcp-organization-admins@company.cloud"
gcp_group_org_security_admins    = "gcp-security-admins@company.cloud"
gcp_group_org_security_reviewers = "gcp-security-admins@company.cloud"
gcp_group_org_billing_admins     = "gcp-billing-admins@company.cloud"
gcp_group_org_viewers            = "gcp-organization-viewers@company.cloud"
gcp_group_org_network_admins     = "gcp-network-admins@company.cloud"
gcp_group_org_network_viewers    = "gcp-organization-viewers@company.cloud"
##################################### AWS Organization ###################
# The tree of organizational units to construct. Defaults to an empty tree.
gcp_organization_environments    = {
  experiment  = {
    environment_code = "exp"
    network          = {
      prefix      = "vpc-exp-network-hub",
      cidr_blocks = {
        region1_primary_ranges = ["172.18.0.0/24"]
        region2_primary_ranges = ["172.18.1.0/24"]
        private_service_range  = "172.19.0.0/24"
      }
    }
    children         = [
      {
        name     = "Department_DDSA",
        children = []
      },
      {
        name     = "Department_DISCO",
        children = []
      }
    ]
  },
  development = {
    environment_code = "dev"
    network          = {
      prefix      = "vpc-dev-network-hub",
      cidr_blocks = {
        region1_primary_ranges = ["172.18.2.0/24"]
        region2_primary_ranges = ["172.18.3.0/24"]
        private_service_range  = "172.19.1.0/24"
      }
    }
    children         = [
      {
        name     = "Department_DISCO",
        children = []
      },
      {
        name     = "Department_DDSA",
        children = []
      }
    ]
  }
}
# The set of accounts to create. Defaults to an empty list.
gcp_business_projects            = [
  {
    name             = "uc1-kube"
    department       = "Department_DISCO"
    environment_code = "exp"
    budget           = {
      amount                    = 100,
      time_unit                 = "MONTHLY",
      email_addresses_to_notify = []
    }
    network          = {
      cidr_blocks = {
        region1_primary_ranges = ["10.0.0.0/27"]
        region2_primary_ranges = ["10.1.0.0/27"]
        region1_secondary_ranges = ["100.71.0.0/22","100.71.4.0/22"]
        region2_secondary_ranges = []
      }
    }
  },
  {
    name             = "uc2-ml-ia"
    department       = "Department_DDSA"
    environment_code = "exp"
    budget           = {
      amount                    = 100,
      time_unit                 = "MONTHLY",
      email_addresses_to_notify = []
    }
    network          = {
      cidr_blocks = {
        region1_primary_ranges = ["10.0.0.32/27"]
        region2_primary_ranges = ["10.1.0.32/27"]
        region1_secondary_ranges = []
        region2_secondary_ranges = []
      }
    }
  },
  {
    name             = "uc3-catalyse"
    department       = "Department_DISCO"
    environment_code = "dev"
    budget           = {
      amount                    = 100,
      time_unit                 = "MONTHLY",
      email_addresses_to_notify = []
    }
    network          = {
      cidr_blocks = {
        region1_primary_ranges = ["10.0.0.64/27"]
        region2_primary_ranges = ["10.1.0.64/27"]
        region1_secondary_ranges = []
        region2_secondary_ranges = []
      }
    }
  }
]

gcp_labels = {
  "managed-by" = "Cloud-Center"
}

gcp_infra_projects = {
  security = {
    name   = "orga-security-audit"
    folder = "Infrastructure"
    budget = {
      amount                    = 100,
      time_unit                 = "MONTHLY",
      email_addresses_to_notify = []
    }
  }

  observability = {
    name   = "orga-monitoring-logging"
    folder = "Infrastructure"
    budget = {
      amount                    = 100,
      time_unit                 = "MONTHLY",
      alert_pubsub_topic        = null
      email_addresses_to_notify = []
    }
  }

  networking_hub = {
    name    = "orga-network-hub"
    folder  = "Infrastructure"
    budget  = {
      amount                    = 100,
      time_unit                 = "MONTHLY",
      email_addresses_to_notify = []
    }
    network = {
      name        = "vpc-org-shared-hub",
      cidr_blocks = {
        region1_primary_ranges = ["172.16.0.0/16"]
        region2_primary_ranges = ["172.17.0.0/16"]
      }
    }
  }
}
