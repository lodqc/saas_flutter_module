import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/ready_apply_cash_entity.dart';

ReadyApplyCashEntity $ReadyApplyCashEntityFromJson(Map<String, dynamic> json) {
  final ReadyApplyCashEntity readyApplyCashEntity = ReadyApplyCashEntity();
  final String? accountName = jsonConvert.convert<String>(json['accountName']);
  if (accountName != null) {
    readyApplyCashEntity.accountName = accountName;
  }
  final int? accountType = jsonConvert.convert<int>(json['accountType']);
  if (accountType != null) {
    readyApplyCashEntity.accountType = accountType;
  }
  final double? amount = jsonConvert.convert<double>(json['amount']);
  if (amount != null) {
    readyApplyCashEntity.amount = amount;
  }
  final String? bank = jsonConvert.convert<String>(json['bank']);
  if (bank != null) {
    readyApplyCashEntity.bank = bank;
  }
  final String? bankChild = jsonConvert.convert<String>(json['bankChild']);
  if (bankChild != null) {
    readyApplyCashEntity.bankChild = bankChild;
  }
  final String? bankNum = jsonConvert.convert<String>(json['bankNum']);
  if (bankNum != null) {
    readyApplyCashEntity.bankNum = bankNum;
  }
  final String? certificatesNum = jsonConvert.convert<String>(
      json['certificatesNum']);
  if (certificatesNum != null) {
    readyApplyCashEntity.certificatesNum = certificatesNum;
  }
  final String? phone = jsonConvert.convert<String>(json['phone']);
  if (phone != null) {
    readyApplyCashEntity.phone = phone;
  }
  final double? taxRate = jsonConvert.convert<double>(json['taxRate']);
  if (taxRate != null) {
    readyApplyCashEntity.taxRate = taxRate;
  }
  final String? verifyCode = jsonConvert.convert<String>(json['verifyCode']);
  if (verifyCode != null) {
    readyApplyCashEntity.verifyCode = verifyCode;
  }
  return readyApplyCashEntity;
}

Map<String, dynamic> $ReadyApplyCashEntityToJson(ReadyApplyCashEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accountName'] = entity.accountName;
  data['accountType'] = entity.accountType;
  data['amount'] = entity.amount;
  data['bank'] = entity.bank;
  data['bankChild'] = entity.bankChild;
  data['bankNum'] = entity.bankNum;
  data['certificatesNum'] = entity.certificatesNum;
  data['phone'] = entity.phone;
  data['taxRate'] = entity.taxRate;
  data['verifyCode'] = entity.verifyCode;
  return data;
}

extension ReadyApplyCashEntityExtension on ReadyApplyCashEntity {
  ReadyApplyCashEntity copyWith({
    String? accountName,
    int? accountType,
    double? amount,
    double? amountReceived,
    double? handlingFee,
    String? bank,
    String? bankChild,
    double? canCashAmount,
    String? bankNum,
    String? certificatesNum,
    String? phone,
    double? taxRate,
    String? verifyCode,
    int? verifyNum,
    bool? canSubmit,
  }) {
    return ReadyApplyCashEntity()
      ..accountName = accountName ?? this.accountName
      ..amountReceived = amountReceived ?? this.amountReceived
      ..handlingFee = handlingFee ?? this.handlingFee
      ..accountType = accountType ?? this.accountType
      ..amount = amount ?? this.amount
      ..bank = bank ?? this.bank
      ..bankChild = bankChild ?? this.bankChild
      ..bankNum = bankNum ?? this.bankNum
      ..certificatesNum = certificatesNum ?? this.certificatesNum
      ..phone = phone ?? this.phone
      ..taxRate = taxRate ?? this.taxRate
      ..verifyCode = verifyCode ?? this.verifyCode
      ..canCashAmount = canCashAmount??this.canCashAmount
      ..canSubmit = canSubmit??this.canSubmit
      ..verifyNum = verifyNum ?? this.verifyNum;
  }
}