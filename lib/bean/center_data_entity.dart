import 'package:saas_flutter_module/generated/json/base/json_field.dart';
import 'package:saas_flutter_module/generated/json/center_data_entity.g.dart';
import 'dart:convert';
export 'package:saas_flutter_module/generated/json/center_data_entity.g.dart';

@JsonSerializable()
class CenterDataEntity {
	int? accountBalance = 0;
	double? canCashAmount = 0;
	int? freezeFlag = 0;
	int? lockedAmount = 0;
	String? mid = '';
	String? phone = '';

	CenterDataEntity();

	factory CenterDataEntity.fromJson(Map<String, dynamic> json) => $CenterDataEntityFromJson(json);

	Map<String, dynamic> toJson() => $CenterDataEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}