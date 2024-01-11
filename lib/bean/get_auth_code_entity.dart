import 'package:saas_flutter_module/generated/json/base/json_field.dart';
import 'package:saas_flutter_module/generated/json/get_auth_code_entity.g.dart';
import 'dart:convert';
export 'package:saas_flutter_module/generated/json/get_auth_code_entity.g.dart';

@JsonSerializable()
class GetAuthCodeEntity {
	String? phone = '';
	int? type = 0;

	GetAuthCodeEntity();

	factory GetAuthCodeEntity.fromJson(Map<String, dynamic> json) => $GetAuthCodeEntityFromJson(json);

	Map<String, dynamic> toJson() => $GetAuthCodeEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}