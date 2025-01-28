Azure Infrastructure Deployment with Terraform
This Terraform configuration sets up a secure and scalable Azure infrastructure as depicted in the architecture diagram. It includes components for network security, access management, and connectivity between on-premises and cloud resources.

Architecture Overview
Resource Group: Organizes all Azure resources.
Azure Active Directory: Manages access with Role-Based Access Control (RBAC).
Azure Firewall: Secures the virtual network and manages inbound/outbound traffic.
Virtual Network (VNet): Contains subnets and facilitates internal communication.
Network Security Group (NSG): Provides additional security by controlling traffic to and from the virtual network.
Virtual Machines (VMs): Hosted within the subnet, each with a public IP for external access.
Web Application Firewall (WAF): Protects web applications from common threats.
Storage Account: Provides scalable storage solutions.
Site-to-Site VPN: Connects on-premises infrastructure to Azure for seamless integration.
Prerequisites
Terraform installed locally.
Azure CLI configured and authenticated.
Necessary permissions to create resources in the Azure subscription.
Usage
Clone the repository.
Initialize Terraform: terraform init
Plan the deployment: terraform plan
Apply the configuration: terraform apply
Notes
Ensure that the necessary Azure resources are available in your subscription.
Review and adjust the Terraform variables to match your environment and requirements.
