# Terraform Azure Project

## Description

This project provisions resources on Microsoft Azure using **Terraform**. The infrastructure is organized into modules for better maintainability and reusability. Each resource, such as storage accounts, virtual machines, and blob containers, is created through Terraform configurations.

---

## 1. Project Structure

The project is modularized, with each resource having its own module. This allows for better code organization and reusability.

```plaintext


├── .terraform/                     # Terraform internal directory
├── modules/                        # Directory containing all modules
│   ├── blob_container_md/          # Module for blob storage container
│   │   ├── main.tf                 # Blob container resource definition
│   │   └── variables.tf            # Variables specific to blob container
│   ├── storage_account_md/         # Module for storage account
│   │   ├── main.tf                 # Storage account resource definition
│   │   └── variables.tf            # Variables specific to storage account
│   ├── vm_md/                      # Module for virtual machine
│   │   ├── main.tf                 # Virtual machine resource definition
│   │   └── variables.tf            # Variables specific to virtual machine
│   ├── web_app_md/                 # Module for web application
│   │   ├── main.tf                 # Web app resource definition
│   │   └── variables.tf            # Variables specific to web app
├── .gitignore                      # Files to be ignored by Git
├── main.tf                         # Root module, calling other modules
├── README.md                       # Project documentation
├── terraform.tfstate               # Terraform state file
├── terraform.tfstate.backup        # Backup of the Terraform state file
├── terraform.tfvars                # Variables file with sensitive data.  but you will not see it on the GitHub repository, you have to create your own .tfvars file. I will add in this ReadMe an example of my .tfvars
└── variables.tf                    # Root module variables
```

## 2. Steps for Creating Resources

### a. Initialize the Terraform Project
First, initialize your Terraform project to download the required providers and set up the working environment:

```bash
terraform init
```
### b. check the configuration
To validate your Terraform configuration and preview the resources that will be created, run:

```bash
terraform plan 
```

### c. deploy the resources
To apply the changes and create the resources on Azure, execute the following command:

```bash
terraform apply
```

## 3. Verify deployment
Once the terraform apply command has run successfully, you can verify that the resources have been deployed either:

- Through the Azure Portal: Navigate to the Azure Portal and check for the newly created resources under the specified resource group.
- Using the Azure CLI: Run the following command to list resources in the resource group:

```bash
az resource list --resource-group <your_resource_group_name>

```

## 4. Conclusion
This project follows best practices by:

- Using modularized Terraform code for resource provisioning.
- Storing environment-specific data in a .tfvars file.
- Ensuring the infrastructure can be deployed and destroyed easily via terraform apply and terraform destroy.


## Exemple of a .tfvars file :

```hcl
rg_name = "de_p1_resource_group"
rg_location = "northeurope"
sa_name = "guilhemsimplon08102024"
vm_size = "Standard_DS1_v2"
vm_storage_acount_type = "Premium_LRS"
vm_image_publisher = "Canonical"
vm_image_offer = "0001-com-ubuntu-server-jammy"
vm_image_sku = "22_04-lts-gen2"
vm_image_version = "latest"
vm_network_interface_id = "/subscriptions/029b3537-0f24-400b-b624-6058a145efe1/resourceGroups/de_p1_resource_group/providers/Microsoft.Network/networkInterfaces/dolet_guilhem_nic"
vm_admin_name = "guilhem"
vm_ssh_public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDAFGjQXCEAWs8/k10MP3oy95+sWIBlkH11vA1P28Z1JiNo2bnuQEC93ujfp5OXtfZ4v0mxhMZMBlP4PFT4phCepKzh8e/BQTKtY8DbzQxH1BSV2uyoItclDX2NggqndFwlQd6pQtLSOrIAM3XqsC0yVBYv90Dort+miq5y8+bbHK4jMt4DY3smDGhWqB4bfVhcXzjblDmG3JZdruMCFwBAzp3kSicaPXTIe+Gh6qpBYuzCYKOp/T62D3iTWLWpV+OL0jeCOarMmZPoiCYBbWbUFWc5/BYqZYs814Jmg/dH7UBTMeEPlPB78m1VYag2MP9PTVs0fY1IVzpUl/5AyMosunbCCNwoG8TtmsvJumbd1Ov2ogTf4DN+zYAH8FjPcgSxgvTlLnMn/jT8tJ0WXiRpcKdZw+9hmQWcN0eN6YJXHzrt6nItNH6IILxEkFrp/pOMGBy156lOa3zRTTYSN3pAvQyWeUqav3QjC8xHOOfW4jhHahLx1kUEDODXpt8ahk0="
web_app_service_plan_id = "/subscriptions/029b3537-0f24-400b-b624-6058a145efe1/resourceGroups/de_p1_resource_group/providers/Microsoft.Web/serverfarms/de_p1_service_plan"
```