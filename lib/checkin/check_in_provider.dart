import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/bean/check_in_entity.dart';
import 'package:saas_flutter_module/net/dio_utils.dart';
import 'package:saas_flutter_module/plugins/pigeon_out.dart';

//巡检打开页面状态
class CheckInEntityNotifier
    extends StateNotifier<CheckInEntity?> {
  CheckInEntityNotifier() : super(null);
  init() async {
    if (state == null) {
      var data = await getClockIn();
      state = data;
    }
  }

  //获取本日本月打卡记录
  Future<CheckInEntity?> getClockIn() {
    return DioUtils.instance.providerRequest<CheckInEntity>(
      Method.get,
      "cloud_manage/manageClockIn/getClockIn",
    );
  }

  void setMapBean(BatteryMapBean data) {
    state = state?.copyWith(bean: data);
  }
}

final checkInProvider =
    StateNotifierProvider<CheckInEntityNotifier, CheckInEntity?>(
        (ref) {
  return CheckInEntityNotifier();
});
