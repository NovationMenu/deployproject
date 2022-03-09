resource "azurerm_kubernetes_cluster" "cluster" {
  name                = "pfr"
  location            = "eastus"
  resource_group_name = "RG-DEPLOYINFRA"
  dns_prefix = "pfr"

  default_node_pool {
    name       = "default"
    node_count = "1"
    vm_size    = "Standard_B4ms"
  }

  network_profile {
        network_plugin    = "kubenet"
        load_balancer_sku = "Standard"
        load_balancer_profile {
        # managed_outbound_ip_count = 1
        outbound_ip_address_ids = [
          "/subscriptions/57d3fd9e-70f7-4ab0-9769-c2e268001ebe/resourceGroups/RG-DEPLOYINFRA/providers/Microsoft.Network/publicIPAddresses/ippfr"
  ]
}
    }

  identity {
    type = "SystemAssigned"
  }
}