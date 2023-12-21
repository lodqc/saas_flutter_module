import 'package:saas_flutter_module/generated/json/base/json_field.dart';
import 'package:saas_flutter_module/generated/json/battery_alarm_bean_entity.g.dart';
import 'dart:convert';
export 'package:saas_flutter_module/generated/json/battery_alarm_bean_entity.g.dart';

@JsonSerializable()
class BatteryAlarmBeanEntity {
	List<BatteryAlarmBeanContent>? content = [];
	int? limit = 0;
	int? page = 0;
	int? totalCount = 0;
	int? totalPage = 0;

	BatteryAlarmBeanEntity();

	factory BatteryAlarmBeanEntity.fromJson(Map<String, dynamic> json) => $BatteryAlarmBeanEntityFromJson(json);

	Map<String, dynamic> toJson() => $BatteryAlarmBeanEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}

@JsonSerializable()
class BatteryAlarmBeanContent {
	String? alarmDesc = '';
	String? alarmExplain = '';
	int? alarmFlag = 0;
	int? alarmTime = 0;
	String? alarmType = '';
	String? batteryBid = '';
	String? batteryId = '';
	String? batterySn = '';
	String? cityCode = '';
	String? cityName = '';
	int? createTime = 0;
	String? doorId = '';
	String? extVal = '';
	String? id = '';
	String? signalId = '';
	String? userId = '';

	BatteryAlarmBeanContent();

	factory BatteryAlarmBeanContent.fromJson(Map<String, dynamic> json) => $BatteryAlarmBeanContentFromJson(json);

	Map<String, dynamic> toJson() => $BatteryAlarmBeanContentToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}