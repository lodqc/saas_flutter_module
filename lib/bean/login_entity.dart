import 'package:saas_flutter_module/generated/json/base/json_field.dart';
import 'dart:convert';
import 'package:saas_flutter_module/generated/json/login_entity.g.dart';

@JsonSerializable()
class LoginEntity {
	bool? institutionAccount = false;
	int? level = 0;
	String? mId = '';
	List<String>? ops = [];
	String? phone = '';
	int? platId = 0;
	int? superAdmin = 0;
	String? tenantId = '';
	String? token = '';
	String? userName = '';
	int? userType = 0;

	LoginEntity();

	factory LoginEntity.fromJson(Map<String, dynamic> json) => $LoginEntityFromJson(json);

	Map<String, dynamic> toJson() => $LoginEntityToJson(this);

	@override
	String toString() {
		return jsonEncode(this);
	}
}