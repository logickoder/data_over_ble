import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'data_over_ble_method_channel.dart';

abstract class DataOverBlePlatform extends PlatformInterface {
  /// Constructs a DataOverBlePlatform.
  DataOverBlePlatform() : super(token: _token);

  static final Object _token = Object();

  static DataOverBlePlatform _instance = MethodChannelDataOverBle();

  /// The default instance of [DataOverBlePlatform] to use.
  ///
  /// Defaults to [MethodChannelDataOverBle].
  static DataOverBlePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [DataOverBlePlatform] when
  /// they register themselves.
  static set instance(DataOverBlePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
