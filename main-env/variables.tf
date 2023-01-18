variable "gcp_organization_id" {
  description = "The organization id for the associated services"
  type        = string
}

variable "gcp_parent_resource_id" {
  type = string
  description = "Can be either an organisation or a folder. Format : organizations/1235 or folders/12562."
}

variable "gcp_organization_domain" {
  type        = string
  description = "The domain of the current organization. Can be different from the organization name. exp:  company.com, cloud.company.com"
}


variable "gcp_billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}


variable "gcp_terraform_sa_email" {
  description = "Service account email of the account to impersonate to run Terraform."
  type        = string
}

variable "gcp_terraform_sa_id" {
  description = "Service account id of the account to impersonate to run Terraform."
  type        = string
}

variable "gcp_default_region1" {
  description = "Default region for resources."
  type        = string
}

variable "gcp_default_region1_azs" {
  description = "Default availability zones for region 1."
  type        = list(string)
}

variable "gcp_organization_environments" {
  type        = map(object({
    environment_code = string,
    network          = object({
      prefix      = string,
      cidr_blocks = object({
        private_subnet_ranges  = list(string)
        data_subnet_ranges     = list(string)
        private_service_range  = string
      })
    })
    children         = list(object({
      name     = string,
      children = list(object({
        name = string
      }))
    }))
  }))
  default     = {}
  description = "The tree of organizational folders to construct. Defaults to an empty tree."
}

variable "gcp_business_projects" {
  type        = list(object({
    name             = string,
    department       = string,
    environment_code = string,
    budget           = object({
      amount                    = number,
      time_unit                 = string,
      email_addresses_to_notify = list(string)
    })
    network          = object({
      cidr_blocks = object({
        private_subnet_ranges = list(string)
        private_subnet_k8s_2nd_ranges = list(string)
        data_subnet_ranges = list(string)
      })
    })
  }))
  default     = []
  description = "The set of projects to create. Defaults to an empty list."
}

variable "gcp_labels" {
  type        = map(string)
  description = "Map of tags"
}

variable "gcp_infra_projects" {
  type = object({
    folder = string
    security       = object({
      name   = string
      budget = object({
        amount                    = number,
        time_unit                 = string,
        email_addresses_to_notify = list(string)
      })
    })
    observability  = object({
      name   = string
      budget = object({
        amount                    = number,
        time_unit                 = string,
        alert_pubsub_topic        = string
        email_addresses_to_notify = list(string)
      })
    })
    networking_hub = object({
      name    = string
      budget  = object({
        amount                    = number,
        time_unit                 = string,
        email_addresses_to_notify = list(string)
      })
      network = object({
        name        = string,
        cidr_blocks = object({
          public_subnet_ranges = list(string)
          private_subnet_ranges = list(string)
          data_subnet_ranges = list(string)
        })
      })
    })
  })
}

variable "gcp_infra_folder_name" {
  default     = "Infrastructure"
  type        = string
  description = "Folder witch will contains all infra projects"
}

variable "gcp_alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded"
  type        = list(number)
  default     = [0.5, 0.75, 0.9, 0.95]
}