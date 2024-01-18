import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/check_in_entity.dart';
import 'package:saas_flutter_module/plugins/pigeon_out.dart';

CheckInEntity $CheckInEntityFromJson(Map<String, dynamic> json) {
  final CheckInEntity checkInEntity = CheckInEntity();
  final String? cityCode = jsonConvert.convert<String>(json['cityCode']);
  if (cityCode != null) {
    checkInEntity.cityCode = cityCode;
  }
  final String? cityName = jsonConvert.convert<String>(json['cityName']);
  if (cityName != null) {
    checkInEntity.cityName = cityName;
  }
  final int? dayClockIn = jsonConvert.convert<int>(json['dayClockIn']);
  if (dayClockIn != null) {
    checkInEntity.dayClockIn = dayClockIn;
  }
  final int? inspectionAll = jsonConvert.convert<int>(json['inspectionAll']);
  if (inspectionAll != null) {
    checkInEntity.inspectionAll = inspectionAll;
  }
  final int? inspectionNo = jsonConvert.convert<int>(json['inspectionNo']);
  if (inspectionNo != null) {
    checkInEntity.inspectionNo = inspectionNo;
  }
  final int? inspectionOk = jsonConvert.convert<int>(json['inspectionOk']);
  if (inspectionOk != null) {
    checkInEntity.inspectionOk = inspectionOk;
  }
  final String? mid = jsonConvert.convert<String>(json['mid']);
  if (mid != null) {
    checkInEntity.mid = mid;
  }
  final int? monthClockIn = jsonConvert.convert<int>(json['monthClockIn']);
  if (monthClockIn != null) {
    checkInEntity.monthClockIn = monthClockIn;
  }
  final String? name = jsonConvert.convert<String>(json['name']);
  if (name != null) {
    checkInEntity.name = name;
  }
  return checkInEntity;
}

Map<String, dynamic> $CheckInEntityToJson(CheckInEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['cityCode'] = entity.cityCode;
  data['cityName'] = entity.cityName;
  data['dayClockIn'] = entity.dayClockIn;
  data['inspectionAll'] = entity.inspectionAll;
  data['inspectionNo'] = entity.inspectionNo;
  data['inspectionOk'] = entity.inspectionOk;
  data['mid'] = entity.mid;
  data['monthClockIn'] = entity.monthClockIn;
  data['name'] = entity.name;
  return data;
}

extension CheckInEntityExtension on CheckInEntity {
  CheckInEntity copyWith({
    String? cityCode,
    String? cityName,
    int? dayClockIn,
    int? inspectionAll,
    int? inspectionNo,
    int? inspectionOk,
    String? mid,
    int? monthClockIn,
    String? name,
    BatteryMapBean? bean,
  }) {
    return CheckInEntity()
      ..cityCode = cityCode ?? this.cityCode
      ..cityName = cityName ?? this.cityName
      ..dayClockIn = dayClockIn ?? this.dayClockIn
      ..inspectionAll = inspectionAll ?? this.inspectionAll
      ..inspectionNo = inspectionNo ?? this.inspectionNo
      ..inspectionOk = inspectionOk ?? this.inspectionOk
      ..mid = mid ?? this.mid
      ..monthClockIn = monthClockIn ?? this.monthClockIn
      ..name = name ?? this.name
      ..bean = bean ?? this.bean;
  }
}