import 'dart:ffi';

import 'package:saas_flutter_module/generated/json/base/json_field.dart';
import 'package:saas_flutter_module/generated/json/ready_apply_cash_entity.g.dart';
import 'dart:convert';
export 'package:saas_flutter_module/generated/json/ready_apply_cash_entity.g.dart';

@JsonSerializable()
class ReadyApplyCashEntity {
	String? accountName = '';
	int? accountType = 0;
	double? canCashAmount;
	double? amount;
	double? handlingFee = 0;
	double? amountReceived = 0;
	String? bank = '';
	String? bankChild = '';
	String? bankNum = '';
	String? certificatesNum = '';
	String? phone = '';
	double? taxRate;
	String? verifyCode = '';
	int verifyNum = -1;
	bool canSubmit = false;

	ReadyApplyCashEntity();

	factory ReadyApplyCashEntity.fromJson(Map<String, dynamic> json) => $ReadyApplyCashEntityFromJson(json);

	Map<String, dynamic> toJson() => $ReadyApplyCashEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}