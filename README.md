# CloudForge — Azure Network Infrastructure with Terraform

CloudForge is an Infrastructure as Code (IaC) project that provisions a foundational Azure network using Terraform.

The project creates a Virtual Network, Subnet, Network Security Group, and associates the NSG with the subnet inside an existing Azure Resource Group.

## Architecture

```text
Existing Azure Resource Group
│
├── Virtual Network
│   └── Subnet
│       └── Network Security Group Association
│
└── Network Security Group
```

## Technologies Used

- **Microsoft Azure** — Cloud infrastructure
- **Terraform** — Infrastructure as Code
- **AzureRM Provider** — Azure resource management
- **GitHub Actions** — Automated Terraform validation

## Infrastructure Components

| Component | Description |
|---|---|
| Resource Group | References an existing Azure Resource Group |
| Virtual Network | Provides an isolated Azure network |
| Subnet | Divides the virtual network into smaller network segments |
| Network Security Group | Defines inbound and outbound network security rules |
| NSG Association | Associates the NSG with the subnet |

## Project Structure

```text
cloudforge-terraform/
│
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars.example
├── .gitignore
│
└── .github/
    └── workflows/
        └── terraform-check.yml
```

## Prerequisites

- Terraform 1.5 or later
- Azure CLI
- An Azure subscription
- An existing Azure Resource Group
- Appropriate Azure RBAC permissions to read the Resource Group and manage the required networking resources

## Configuration

Clone the repository:

```bash
git clone https://github.com/YOUR_USERNAME/cloudforge-terraform.git
cd cloudforge-terraform
```

Create a local variables file:

**Linux/macOS:**
```bash
cp terraform.tfvars.example terraform.tfvars
```

**Windows PowerShell:**
```powershell
Copy-Item terraform.tfvars.example terraform.tfvars
```

Update `terraform.tfvars` with your environment details:

```hcl
resource_group_name = "YOUR_EXISTING_RESOURCE_GROUP"
location            = "eastus"
```

The actual variable names and values should match `variables.tf` and the example file.

Do not commit `terraform.tfvars` or sensitive environment-specific values.

## Terraform Workflow

Format the configuration:

```bash
terraform fmt -recursive
```

Initialize Terraform:

```bash
terraform init
```

Validate the configuration:

```bash
terraform validate
```

Review the proposed infrastructure changes:

```bash
terraform plan
```

Deploy only after reviewing the plan and confirming that the Azure identity has the required permissions:

```bash
terraform apply
```

## Verify Infrastructure

List the Virtual Networks:

```bash
az network vnet list --resource-group YOUR_RESOURCE_GROUP --output table
```

List the Network Security Groups:

```bash
az network nsg list --resource-group YOUR_RESOURCE_GROUP --output table
```

## GitHub Actions

The repository includes a GitHub Actions workflow that automatically:

- Checks Terraform formatting.
- Initializes Terraform without configuring a remote backend.
- Validates the Terraform configuration.

The workflow runs on repository changes and does not deploy infrastructure to Azure or require Azure credentials.

## Security Considerations

- The Resource Group is referenced rather than created.
- Environment-specific variables are kept outside version control.
- Azure credentials and secrets are not stored in the repository.
- NSG rules should follow the principle of least privilege.
- Review Terraform plans before applying infrastructure changes.

## Cleanup

To remove resources managed by this Terraform configuration:

```bash
terraform destroy
```

Review the destruction plan carefully before confirming. The pre-existing Resource Group is not managed by this configuration and should remain intact.

## Future Improvements

- Introduce reusable Terraform modules.
- Configure remote Terraform state.
- Implement GitHub Actions authentication using Azure workload identity federation (OIDC).
- Add security and policy validation.
- Introduce environment-specific configurations and deployment approvals.

## Project Status

**Personal Infrastructure as Code project — Terraform configuration and automated validation.**

Actual Azure deployment depends on access to an appropriately authorized Azure subscription.
