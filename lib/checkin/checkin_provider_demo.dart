import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/bean/battery_alarm_bean_entity.dart';
import 'package:saas_flutter_module/bean/login_body_bean.dart';
import 'package:saas_flutter_module/bean/login_entity.dart';
import 'package:saas_flutter_module/net/dio_utils.dart';

final batteryAlarmProvider =
StateNotifierProvider<BatteryAlarmNotifier, List<BatteryAlarmBeanContent>>(
        (ref) {
      return BatteryAlarmNotifier();
    });

class BatteryAlarmNotifier
    extends StateNotifier<List<BatteryAlarmBeanContent>> {
  int _page = 1;
  bool _isLoading = false;
  num _maxPage = 1;

  BatteryAlarmNotifier() : super([]);

  fetch() async {
    var data = await DioUtils.instance.requestNetwork<BatteryAlarmBeanEntity>(
      Method.get,
      "cloud_manage/batteryAlarm/list/app",
      queryParameters: {
        "batterySn": "B0602GF23708739",
        "pageIndex": _page,
        "pageSize": 15
      },
    );
    if(_isLoading){
      var list = data?.content??[];
      state = [...state,...list];
    }else{
      state = data?.content??[];
    }
    _maxPage = (data?.totalCount ?? 0) / 15 + 1;
  }

  Future<void> refresh() async {
    _page = 1;
    await fetch();
  }

  bool hasMore() {
    return _page < _maxPage;
  }

  Future<void> loadMore() async {
    if (_isLoading) {
      return;
    }
    if (!hasMore()) {
      return;
    }
    _isLoading = true;
    await fetch();
    _page++;
    _isLoading = false;
  }
}
