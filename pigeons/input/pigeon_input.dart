import 'package:pigeon/pigeon.dart';

//网络请求头数据
class NetHeaderBean {
  final String authorization;
  final String userAgent;
  final String cityCode;
  final String acceptLanguage;
  final String baseUrl;

  NetHeaderBean(
      this.authorization, this.userAgent, this.cityCode, this.acceptLanguage, this.baseUrl);
}

//地图坐标数据
class BatteryMapBean {
  final String address;
  final double latitude;
  final double longitude;
  final String time;

  BatteryMapBean(this.address, this.latitude, this.longitude, this.time);
}

//Flutter调用原生方法 原生去实现
@HostApi()
abstract class FlutterToNative {
  NetHeaderBean getNetHeaderBean();
  void navigation();
  void scan();
}

// 原生调用Flutter Flutter去实现
@FlutterApi()
abstract class NativeToFlutter {
  void setBatteryMapBean(BatteryMapBean bean);
  void setCheckInSn(String sn);
}
