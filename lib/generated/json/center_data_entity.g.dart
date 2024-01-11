import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/center_data_entity.dart';

CenterDataEntity $CenterDataEntityFromJson(Map<String, dynamic> json) {
  final CenterDataEntity centerDataEntity = CenterDataEntity();
  final int? accountBalance = jsonConvert.convert<int>(json['accountBalance']);
  if (accountBalance != null) {
    centerDataEntity.accountBalance = accountBalance;
  }
  final double? canCashAmount = jsonConvert.convert<double>(
      json['canCashAmount']);
  if (canCashAmount != null) {
    centerDataEntity.canCashAmount = canCashAmount;
  }
  final int? freezeFlag = jsonConvert.convert<int>(json['freezeFlag']);
  if (freezeFlag != null) {
    centerDataEntity.freezeFlag = freezeFlag;
  }
  final int? lockedAmount = jsonConvert.convert<int>(json['lockedAmount']);
  if (lockedAmount != null) {
    centerDataEntity.lockedAmount = lockedAmount;
  }
  final String? mid = jsonConvert.convert<String>(json['mid']);
  if (mid != null) {
    centerDataEntity.mid = mid;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    centerDataEntity.phone = phone;
  }
  return centerDataEntity;
}

Map<String, dynamic> $CenterDataEntityToJson(CenterDataEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accountBalance'] = entity.accountBalance;
  data['canCashAmount'] = entity.canCashAmount;
  data['freezeFlag'] = entity.freezeFlag;
  data['lockedAmount'] = entity.lockedAmount;
  data['mid'] = entity.mid;
  data['phone'] = entity.phone;
  return data;
}

extension CenterDataEntityExtension on CenterDataEntity {
  CenterDataEntity copyWith({
    int? accountBalance,
    double? canCashAmount,
    int? freezeFlag,
    int? lockedAmount,
    String? mid,
    String? phone,
  }) {
    return CenterDataEntity()
      ..accountBalance = accountBalance ?? this.accountBalance
      ..canCashAmount = canCashAmount ?? this.canCashAmount
      ..freezeFlag = freezeFlag ?? this.freezeFlag
      ..lockedAmount = lockedAmount ?? this.lockedAmount
      ..mid = mid ?? this.mid
      ..phone = phone ?? this.phone;
  }
}