<table>
<tbody>
<tr>
<td><a href="./main-bootstrap/README.md">bootstrap</a></td>
<td>Bootstraps a Google Cloud organization, creating all the required resources
and permissions. 
</td>
</tr>
<tr>
<td><a href="./main-infra/README.md">infrastructure</a></td>
<td>Sets up top-level shared folders, monitoring and networking projects, and
organization-level logging, and sets baseline security settings through
organizational policy.</td>
</tr>
<tr>
<td><a href="./main-env/README.md"><span style="white-space: nowrap;">environments</span></a></td>
<td>Sets up development, non-production, and production environments within the
Google Cloud organization that you've created.</td>
</tr>
<tr>
<td><a href="./main-bp/README.md">projects</a></td>
<td>Set up a folder structure, projects for applications,
 which are connected as service projects to the shared VPC created in the previous stage.</td>
</tr>
<tr>
<td><a href="./main-custom/README.md">custom</a></td>
<td>Set up custom services for application.</td>
</tr>
</tbody>
</table>

### Prerequisites
Before stating, make sure that you've done the following:

1. Set up a Google Cloud [organization](https://cloud.google.com/resource-manager/docs/creating-managing-organization).
2. Set up a Google Cloud [billing account](https://cloud.google.com/billing/docs/how-to/manage-billing-account).
3. Create Cloud Identity or Google Workspace groups for organization and billing admins.
4. Create a dedicated folder (optional, can use the organisation as container)
5. Create a bootstrap GCP project that will be used for running terraform scripts
6. Create a service account with the following permissions
   - organisation -> Billing Account Costs Manager
   - organisation -> Billing Account User
   - folder -> Owner
   - folder -> Project Creator
   - folder -> Security Admin
   - folder -> Service Account Token Creator
   - folder -> Service Account User
7. Create the following groups (optional)
   - xx-organization-admins@example.com
   - xx-security-admins@example.com
   - xx-security-reviewers@example.com
   - xx-billing-admins@example.com
   - xx-organization-viewers@example.com
   - xx-network-admins@example.com
   - xx-network-viewers@example.com
8. On bootstrap project, enable the flowing APIs
   - IAM Service Account Credentials API
   - Cloud Resource Manager API

### Installation
1. Clone the repo
   ```sh
   git clone https://github.com/belgacem-io/gcp-landing-zone.git
   ```
2. For each module main-xxx, create a terraform.tfvars file with the appropriates values
3. Create a service account key and download the credentials file as JSON
4. Create an '.auth/env' file and add required variables 
   ```sh
   ##################################### GCP Credentials ###################
   export GOOGLE_APPLICATION_CREDENTIALS=/wks/.auth/application_default_credentials.json
   export PROJECT_ID=xx-bootstrap-prod-375008
   export PROJECT_NAME=xx-bootstrap-prod
   
   ##################################### tfvars generator ###################
   export REGION=europe-west9
   export ORGANISATION_ID=25135412153
   export ORGANISATION_DOMAIN=example.com
   export ORGANISATION_PREFIX=xx
   export CONTAINER_ID=folders/2565982345
   export BILLING_ACCOUNT_ID=AAAAA-BBBBB-CCCCC
   export AUTOMATION_SA=lz-automation@xx-bootstrap-prod-375008.iam.gserviceaccount.com
   #export TF_LOG=INFO
   ```
5. Setup your local environment
   ```sh
    make up
    ./terraformd --insall
   ```
   terraform
6. Init [bootstrap project](./main-bootstrap/README.md) 
   ```sh
    terraformd -chdir=main-bootstap init && terraformd -chdir=main-bootstap apply
   ```
7. Create and configure [infra projects](./main-infra/README.md)
   ```sh
    terraformd -chdir=main-infra init
    terraformd -chdir=main-infra apply -target module.infra_projects
    terraformd -chdir=main-infra apply
   ```
8. Create and configure [env projects](./main-env/README.md)
   ```sh
    terraformd -chdir=main-env init && terraformd -chdir=main-env apply
   ```
9. Create and configure [business projects](./main-bp/README.md)
   ```sh
    terraformd -chdir=main-bp init && terraformd -chdir=main-bp apply
   ```