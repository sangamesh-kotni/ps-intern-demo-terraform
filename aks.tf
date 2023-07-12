
resource "azurerm_kubernetes_cluster" "ba_aks" {
  name                ="aks-${var.prefix}"
  location            = azurerm_resource_group.intern_rg.location
  resource_group_name = azurerm_resource_group.intern_rg.name
  dns_prefix          = var.prefix


  default_node_pool {
    name       = "pool${var.prefix}"
    node_count = 1
    vm_size    = "Standard_B2s"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "dev"
  }
}

resource "azurerm_role_assignment" "role_assignment" {
  principal_id                     = azurerm_kubernetes_cluster.ba_aks.kubelet_identity[0].object_id
  role_definition_name             = "AcrPull"
  scope                            = azurerm_container_registry.acr.id
  skip_service_principal_aad_check = true
}