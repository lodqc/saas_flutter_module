import 'package:saas_flutter_module/generated/json/base/json_field.dart';
import 'package:saas_flutter_module/generated/json/check_in_entity.g.dart';
import 'dart:convert';

import 'package:saas_flutter_module/plugins/pigeon_out.dart';
export 'package:saas_flutter_module/generated/json/check_in_entity.g.dart';

@JsonSerializable()
class CheckInEntity {
	String? cityCode = '';
	String? cityName = '';
	int? dayClockIn = 0;
	int? inspectionAll = 0;
	int? inspectionNo = 0;
	int? inspectionOk = 0;
	String? mid = '';
	int? monthClockIn = 0;
	String? name = '';
	BatteryMapBean? bean;

	CheckInEntity();

	factory CheckInEntity.fromJson(Map<String, dynamic> json) => $CheckInEntityFromJson(json);

	Map<String, dynamic> toJson() => $CheckInEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}