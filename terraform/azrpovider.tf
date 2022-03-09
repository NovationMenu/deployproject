terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.1"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}

data "azurerm_resource_group" "RG-DEPLOYINFRA" {
  name = "RG-DEPLOYINFRA"
}

data "azurerm_public_ip" "ippfr" {
  name                = "ippfr"
  resource_group_name = "RG-DEPLOYINFRA"
}

output "public_ip_address" {
  value = "${data.azurerm_public_ip.ippfr.ip_address}"
}

terraform {
  backend "azurerm" {
    subscription_id      = "57d3fd9e-70f7-4ab0-9769-c2e268001ebe"
    resource_group_name  = "RG-DEPLOYINFRA"
    storage_account_name = "sadeployinfra"
    container_name       = "terraform-state"
    key                  = "terraform.tfstate"
  }
}
