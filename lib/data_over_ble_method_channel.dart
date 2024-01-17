import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'data_over_ble_platform_interface.dart';

/// An implementation of [DataOverBlePlatform] that uses method channels.
class MethodChannelDataOverBle extends DataOverBlePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('data_over_ble');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
