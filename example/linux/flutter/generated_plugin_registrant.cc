//
//  Generated file. Do not edit.
//

// clang-format off

#include "generated_plugin_registrant.h"

#include <data_over_ble/data_over_ble_plugin.h>

void fl_register_plugins(FlPluginRegistry* registry) {
  g_autoptr(FlPluginRegistrar) data_over_ble_registrar =
      fl_plugin_registry_get_registrar_for_plugin(registry, "DataOverBlePlugin");
  data_over_ble_plugin_register_with_registrar(data_over_ble_registrar);
}
