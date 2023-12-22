import 'dart:ui';
import 'package:saas_flutter_module/plugins/pigeon_out.dart';

typedef BatteryMapCallback = Function(BatteryMapBean bean);

class SaasPlugin implements NativeToFlutter {
  final BatteryMapCallback? batteryMapCallback;
  const SaasPlugin({this.batteryMapCallback});

  @override
  void setBatteryMapBean(BatteryMapBean bean) {
    batteryMapCallback?.call(bean);
  }
}