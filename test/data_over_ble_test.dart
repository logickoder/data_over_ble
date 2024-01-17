import 'package:flutter_test/flutter_test.dart';
import 'package:data_over_ble/data_over_ble.dart';
import 'package:data_over_ble/data_over_ble_platform_interface.dart';
import 'package:data_over_ble/data_over_ble_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockDataOverBlePlatform
    with MockPlatformInterfaceMixin
    implements DataOverBlePlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final DataOverBlePlatform initialPlatform = DataOverBlePlatform.instance;

  test('$MethodChannelDataOverBle is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelDataOverBle>());
  });

  test('getPlatformVersion', () async {
    DataOverBle dataOverBlePlugin = DataOverBle();
    MockDataOverBlePlatform fakePlatform = MockDataOverBlePlatform();
    DataOverBlePlatform.instance = fakePlatform;

    expect(await dataOverBlePlugin.getPlatformVersion(), '42');
  });
}
