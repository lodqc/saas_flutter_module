import 'package:saas_flutter_module/plugins/pigeon_out.dart';

typedef BatteryMapCallback = Function(BatteryMapBean bean);
typedef CheckInCallback = Function(String sn);

class SaasPlugin implements NativeToFlutter {
  final BatteryMapCallback? batteryMapCallback;
  final CheckInCallback? checkInCallback;
  const SaasPlugin({this.batteryMapCallback,this.checkInCallback});

  @override
  void setBatteryMapBean(BatteryMapBean bean) {
    batteryMapCallback?.call(bean);
  }

  @override
  void setCheckInSn(String sn) {
    checkInCallback?.call(sn);
  }
}