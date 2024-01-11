import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/get_auth_code_entity.dart';

GetAuthCodeEntity $GetAuthCodeEntityFromJson(Map<String, dynamic> json) {
  final GetAuthCodeEntity getAuthCodeEntity = GetAuthCodeEntity();
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    getAuthCodeEntity.phone = phone;
  }
  final int? type = jsonConvert.convert<int>(json['type']);
  if (type != null) {
    getAuthCodeEntity.type = type;
  }
  return getAuthCodeEntity;
}

Map<String, dynamic> $GetAuthCodeEntityToJson(GetAuthCodeEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['phone'] = entity.phone;
  data['type'] = entity.type;
  return data;
}

extension GetAuthCodeEntityExtension on GetAuthCodeEntity {
  GetAuthCodeEntity copyWith({
    String? phone,
    int? type,
  }) {
    return GetAuthCodeEntity()
      ..phone = phone ?? this.phone
      ..type = type ?? this.type;
  }
}