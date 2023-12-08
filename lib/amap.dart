import 'package:amap_flutter_map/amap_flutter_map.dart';
import 'package:flutter/material.dart';
import 'package:saas_flutter_module/util/const_config.dart';

class AMapPage extends StatelessWidget {
  final AMapWidget map = AMapWidget(
    privacyStatement: ConstConfig.amapPrivacyStatement,
    apiKey: ConstConfig.amapApiKeys,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: map,
      ),
    );
  }
}
