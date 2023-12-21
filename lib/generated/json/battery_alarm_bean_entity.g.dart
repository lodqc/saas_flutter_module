import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/battery_alarm_bean_entity.dart';

BatteryAlarmBeanEntity $BatteryAlarmBeanEntityFromJson(
    Map<String, dynamic> json) {
  final BatteryAlarmBeanEntity batteryAlarmBeanEntity = BatteryAlarmBeanEntity();
  final List<BatteryAlarmBeanContent>? content = (json['content'] as List<
      dynamic>?)?.map(
          (e) =>
      jsonConvert.convert<BatteryAlarmBeanContent>(
          e) as BatteryAlarmBeanContent).toList();
  if (content != null) {
    batteryAlarmBeanEntity.content = content;
  }
  final int? limit = jsonConvert.convert<int>(json['limit']);
  if (limit != null) {
    batteryAlarmBeanEntity.limit = limit;
  }
  final int? page = jsonConvert.convert<int>(json['page']);
  if (page != null) {
    batteryAlarmBeanEntity.page = page;
  }
  final int? totalCount = jsonConvert.convert<int>(json['totalCount']);
  if (totalCount != null) {
    batteryAlarmBeanEntity.totalCount = totalCount;
  }
  final int? totalPage = jsonConvert.convert<int>(json['totalPage']);
  if (totalPage != null) {
    batteryAlarmBeanEntity.totalPage = totalPage;
  }
  return batteryAlarmBeanEntity;
}

Map<String, dynamic> $BatteryAlarmBeanEntityToJson(
    BatteryAlarmBeanEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['content'] = entity.content?.map((v) => v.toJson()).toList();
  data['limit'] = entity.limit;
  data['page'] = entity.page;
  data['totalCount'] = entity.totalCount;
  data['totalPage'] = entity.totalPage;
  return data;
}

extension BatteryAlarmBeanEntityExtension on BatteryAlarmBeanEntity {
  BatteryAlarmBeanEntity copyWith({
    List<BatteryAlarmBeanContent>? content,
    int? limit,
    int? page,
    int? totalCount,
    int? totalPage,
  }) {
    return BatteryAlarmBeanEntity()
      ..content = content ?? this.content
      ..limit = limit ?? this.limit
      ..page = page ?? this.page
      ..totalCount = totalCount ?? this.totalCount
      ..totalPage = totalPage ?? this.totalPage;
  }
}

BatteryAlarmBeanContent $BatteryAlarmBeanContentFromJson(
    Map<String, dynamic> json) {
  final BatteryAlarmBeanContent batteryAlarmBeanContent = BatteryAlarmBeanContent();
  final String? alarmDesc = jsonConvert.convert<String>(json['alarmDesc']);
  if (alarmDesc != null) {
    batteryAlarmBeanContent.alarmDesc = alarmDesc;
  }
  final String? alarmExplain = jsonConvert.convert<String>(
      json['alarmExplain']);
  if (alarmExplain != null) {
    batteryAlarmBeanContent.alarmExplain = alarmExplain;
  }
  final int? alarmFlag = jsonConvert.convert<int>(json['alarmFlag']);
  if (alarmFlag != null) {
    batteryAlarmBeanContent.alarmFlag = alarmFlag;
  }
  final int? alarmTime = jsonConvert.convert<int>(json['alarmTime']);
  if (alarmTime != null) {
    batteryAlarmBeanContent.alarmTime = alarmTime;
  }
  final String? alarmType = jsonConvert.convert<String>(json['alarmType']);
  if (alarmType != null) {
    batteryAlarmBeanContent.alarmType = alarmType;
  }
  final String? batteryBid = jsonConvert.convert<String>(json['batteryBid']);
  if (batteryBid != null) {
    batteryAlarmBeanContent.batteryBid = batteryBid;
  }
  final String? batteryId = jsonConvert.convert<String>(json['batteryId']);
  if (batteryId != null) {
    batteryAlarmBeanContent.batteryId = batteryId;
  }
  final String? batterySn = jsonConvert.convert<String>(json['batterySn']);
  if (batterySn != null) {
    batteryAlarmBeanContent.batterySn = batterySn;
  }
  final String? cityCode = jsonConvert.convert<String>(json['cityCode']);
  if (cityCode != null) {
    batteryAlarmBeanContent.cityCode = cityCode;
  }
  final String? cityName = jsonConvert.convert<String>(json['cityName']);
  if (cityName != null) {
    batteryAlarmBeanContent.cityName = cityName;
  }
  final int? createTime = jsonConvert.convert<int>(json['createTime']);
  if (createTime != null) {
    batteryAlarmBeanContent.createTime = createTime;
  }
  final String? doorId = jsonConvert.convert<String>(json['doorId']);
  if (doorId != null) {
    batteryAlarmBeanContent.doorId = doorId;
  }
  final String? extVal = jsonConvert.convert<String>(json['extVal']);
  if (extVal != null) {
    batteryAlarmBeanContent.extVal = extVal;
  }
  final String? id = jsonConvert.convert<String>(json['id']);
  if (id != null) {
    batteryAlarmBeanContent.id = id;
  }
  final String? signalId = jsonConvert.convert<String>(json['signalId']);
  if (signalId != null) {
    batteryAlarmBeanContent.signalId = signalId;
  }
  final String? userId = jsonConvert.convert<String>(json['userId']);
  if (userId != null) {
    batteryAlarmBeanContent.userId = userId;
  }
  return batteryAlarmBeanContent;
}

Map<String, dynamic> $BatteryAlarmBeanContentToJson(
    BatteryAlarmBeanContent entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['alarmDesc'] = entity.alarmDesc;
  data['alarmExplain'] = entity.alarmExplain;
  data['alarmFlag'] = entity.alarmFlag;
  data['alarmTime'] = entity.alarmTime;
  data['alarmType'] = entity.alarmType;
  data['batteryBid'] = entity.batteryBid;
  data['batteryId'] = entity.batteryId;
  data['batterySn'] = entity.batterySn;
  data['cityCode'] = entity.cityCode;
  data['cityName'] = entity.cityName;
  data['createTime'] = entity.createTime;
  data['doorId'] = entity.doorId;
  data['extVal'] = entity.extVal;
  data['id'] = entity.id;
  data['signalId'] = entity.signalId;
  data['userId'] = entity.userId;
  return data;
}

extension BatteryAlarmBeanContentExtension on BatteryAlarmBeanContent {
  BatteryAlarmBeanContent copyWith({
    String? alarmDesc,
    String? alarmExplain,
    int? alarmFlag,
    int? alarmTime,
    String? alarmType,
    String? batteryBid,
    String? batteryId,
    String? batterySn,
    String? cityCode,
    String? cityName,
    int? createTime,
    String? doorId,
    String? extVal,
    String? id,
    String? signalId,
    String? userId,
  }) {
    return BatteryAlarmBeanContent()
      ..alarmDesc = alarmDesc ?? this.alarmDesc
      ..alarmExplain = alarmExplain ?? this.alarmExplain
      ..alarmFlag = alarmFlag ?? this.alarmFlag
      ..alarmTime = alarmTime ?? this.alarmTime
      ..alarmType = alarmType ?? this.alarmType
      ..batteryBid = batteryBid ?? this.batteryBid
      ..batteryId = batteryId ?? this.batteryId
      ..batterySn = batterySn ?? this.batterySn
      ..cityCode = cityCode ?? this.cityCode
      ..cityName = cityName ?? this.cityName
      ..createTime = createTime ?? this.createTime
      ..doorId = doorId ?? this.doorId
      ..extVal = extVal ?? this.extVal
      ..id = id ?? this.id
      ..signalId = signalId ?? this.signalId
      ..userId = userId ?? this.userId;
  }
}