import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/login_entity.dart';

LoginEntity $LoginEntityFromJson(Map<String, dynamic> json) {
  final LoginEntity loginEntity = LoginEntity();
  final bool? institutionAccount = jsonConvert.convert<bool>(
      json['institutionAccount']);
  if (institutionAccount != null) {
    loginEntity.institutionAccount = institutionAccount;
  }
  final int? level = jsonConvert.convert<int>(json['level']);
  if (level != null) {
    loginEntity.level = level;
  }
  final String? mId = jsonConvert.convert<String>(json['mId']);
  if (mId != null) {
    loginEntity.mId = mId;
  }
  final List<String>? ops = (json['ops'] as List<dynamic>?)?.map(
          (e) => jsonConvert.convert<String>(e) as String).toList();
  if (ops != null) {
    loginEntity.ops = ops;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    loginEntity.phone = phone;
  }
  final int? platId = jsonConvert.convert<int>(json['platId']);
  if (platId != null) {
    loginEntity.platId = platId;
  }
  final int? superAdmin = jsonConvert.convert<int>(json['superAdmin']);
  if (superAdmin != null) {
    loginEntity.superAdmin = superAdmin;
  }
  final String? tenantId = jsonConvert.convert<String>(json['tenantId']);
  if (tenantId != null) {
    loginEntity.tenantId = tenantId;
  }
  final String? token = jsonConvert.convert<String>(json['token']);
  if (token != null) {
    loginEntity.token = token;
  }
  final String? userName = jsonConvert.convert<String>(json['userName']);
  if (userName != null) {
    loginEntity.userName = userName;
  }
  final int? userType = jsonConvert.convert<int>(json['userType']);
  if (userType != null) {
    loginEntity.userType = userType;
  }
  return loginEntity;
}

Map<String, dynamic> $LoginEntityToJson(LoginEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['institutionAccount'] = entity.institutionAccount;
  data['level'] = entity.level;
  data['mId'] = entity.mId;
  data['ops'] = entity.ops;
  data['phone'] = entity.phone;
  data['platId'] = entity.platId;
  data['superAdmin'] = entity.superAdmin;
  data['tenantId'] = entity.tenantId;
  data['token'] = entity.token;
  data['userName'] = entity.userName;
  data['userType'] = entity.userType;
  return data;
}

extension LoginEntityExtension on LoginEntity {
  LoginEntity copyWith({
    bool? institutionAccount,
    int? level,
    String? mId,
    List<String>? ops,
    String? phone,
    int? platId,
    int? superAdmin,
    String? tenantId,
    String? token,
    String? userName,
    int? userType,
  }) {
    return LoginEntity()
      ..institutionAccount = institutionAccount ?? this.institutionAccount
      ..level = level ?? this.level
      ..mId = mId ?? this.mId
      ..ops = ops ?? this.ops
      ..phone = phone ?? this.phone
      ..platId = platId ?? this.platId
      ..superAdmin = superAdmin ?? this.superAdmin
      ..tenantId = tenantId ?? this.tenantId
      ..token = token ?? this.token
      ..userName = userName ?? this.userName
      ..userType = userType ?? this.userType;
  }
}