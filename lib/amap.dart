import 'dart:convert';
import 'package:amap_flutter_base/amap_flutter_base.dart';
import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:saas_flutter_module/bean/battery_map_bean.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/util/const_config.dart';
import 'package:saas_flutter_module/widgets/TextIconButton.dart';

class AMapPage extends StatefulWidget {
  const AMapPage({super.key});

  @override
  State<AMapPage> createState() => _AMapPageState();
}

class _AMapPageState extends State<AMapPage> {
  late MethodChannel _channel;
  AMapWidget? map;
  BatteryMapBean? _bean;

  @override
  void initState() {
    super.initState();
    _channel = const MethodChannel('saas-merchants-android');
    _channel.setMethodCallHandler((call) async {
      if (call.method == "setMapBean") {
        setState(() {
          var content = call.arguments as String;
          LogUtil.e(content);
          _bean = BatteryMapBean.fromJson(json.decode(content));
          map = AMapWidget(
            privacyStatement: ConstConfig.amapPrivacyStatement,
            apiKey: ConstConfig.amapApiKeys,
            initialCameraPosition: CameraPosition(
                target: LatLng(_bean?.latitude?.toDouble() ?? 0,
                    _bean?.longitude?.toDouble() ?? 0),
                zoom: 15),
            markers: {
              Marker(
                  position: LatLng(_bean?.latitude?.toDouble() ?? 0,
                      _bean?.longitude?.toDouble() ?? 0),
                  icon: BitmapDescriptor.fromIconPath(
                      'assets/images/ic_battery0.png'))
            },
          );
        });
      } else {
        throw Exception('not implemented ${call.method}');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            map ?? Container(),
            Positioned(
              bottom: 42,
              left: 10,
              right: 10,
              child: Container(
                height: 128,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Colours.color_FFFFFFFF,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 44,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(_bean?.address ?? "",
                                maxLines: 2, style: TextStyles.text14N),
                            flex: 1,
                          ),
                          Container(
                            width: 1,
                            height: 24,
                            color: Colours.color_FFF0F0F0,
                            margin: EdgeInsets.only(left: 12, right: 16),
                          ),
                          Material(
                            child: TextIconButton(
                              onTap: () =>
                                  {_channel.invokeMethod("navigation")},
                              icon: Images.ic_battery1,
                              text: Text('地图导航',
                                  maxLines: 2,
                                  style: TextStyles.color_FF888888_12N),
                              type: TextIconButtonType.imageTop,
                            ),
                            color: Colours.color_FFFFFFFF,
                          )
                        ],
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(top: 12)),
                    Text('经纬度：${_bean?.latitude ?? 0},${_bean?.longitude ?? 0}',
                        style: TextStyles.color_FF888888_12N),
                    Padding(padding: EdgeInsets.only(top: 4)),
                    Text(
                        '最后上报：${DateFormat("yyyy/MM/dd HH:mm:ss").format(DateTime.fromMillisecondsSinceEpoch(_bean?.time?.toInt() ?? 0))}',
                        style: TextStyles.color_FF888888_12N),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
