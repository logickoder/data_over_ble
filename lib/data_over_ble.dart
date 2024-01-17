
import 'data_over_ble_platform_interface.dart';

class DataOverBle {
  Future<String?> getPlatformVersion() {
    return DataOverBlePlatform.instance.getPlatformVersion();
  }
}
