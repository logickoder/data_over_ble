#include "include/data_over_ble/data_over_ble_plugin_c_api.h"

#include <flutter/plugin_registrar_windows.h>

#include "data_over_ble_plugin.h"

void DataOverBlePluginCApiRegisterWithRegistrar(
    FlutterDesktopPluginRegistrarRef registrar) {
  data_over_ble::DataOverBlePlugin::RegisterWithRegistrar(
      flutter::PluginRegistrarManager::GetInstance()
          ->GetRegistrar<flutter::PluginRegistrarWindows>(registrar));
}
