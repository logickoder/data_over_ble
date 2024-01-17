#ifndef FLUTTER_PLUGIN_DATA_OVER_BLE_PLUGIN_H_
#define FLUTTER_PLUGIN_DATA_OVER_BLE_PLUGIN_H_

#include <flutter/method_channel.h>
#include <flutter/plugin_registrar_windows.h>

#include <memory>

namespace data_over_ble {

class DataOverBlePlugin : public flutter::Plugin {
 public:
  static void RegisterWithRegistrar(flutter::PluginRegistrarWindows *registrar);

  DataOverBlePlugin();

  virtual ~DataOverBlePlugin();

  // Disallow copy and assign.
  DataOverBlePlugin(const DataOverBlePlugin&) = delete;
  DataOverBlePlugin& operator=(const DataOverBlePlugin&) = delete;

  // Called when a method is called on this plugin's channel from Dart.
  void HandleMethodCall(
      const flutter::MethodCall<flutter::EncodableValue> &method_call,
      std::unique_ptr<flutter::MethodResult<flutter::EncodableValue>> result);
};

}  // namespace data_over_ble

#endif  // FLUTTER_PLUGIN_DATA_OVER_BLE_PLUGIN_H_
