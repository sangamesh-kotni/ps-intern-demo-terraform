resource "azurerm_container_registry" "acr" {
  name                = "acr${var.prefix}"
  resource_group_name = azurerm_resource_group.intern_rg.name
  location            = azurerm_resource_group.intern_rg.location
  sku                 = "Standard"
  admin_enabled       = true
}


resource "azurerm_container_registry_scope_map" "scope_map" {
  name                    = "spring-scope-map"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = azurerm_resource_group.intern_rg.name
  actions = [
    "repositories/spring/content/read",
    "repositories/spring/content/write"
  ]
}

resource "azurerm_container_registry_token" "token" {
  name                    = "token-${var.prefix}"
  container_registry_name = azurerm_container_registry.acr.name
  resource_group_name     = azurerm_resource_group.intern_rg.name
  scope_map_id            = azurerm_container_registry_scope_map.scope_map.id
}