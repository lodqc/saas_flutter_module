import 'package:saas_flutter_module/generated/json/base/json_convert_content.dart';
import 'package:saas_flutter_module/bean/ready_apply_cash_entity.dart';
import 'dart:ffi';


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
  final double? canCashAmount = jsonConvert.convert<double>(
      json['canCashAmount']);
  if (canCashAmount != null) {
    readyApplyCashEntity.canCashAmount = canCashAmount;
  }
  final int? amount = jsonConvert.convert<int>(json['amount']);
  if (amount != null) {
    readyApplyCashEntity.amount = amount;
  }
  final double? handlingFee = jsonConvert.convert<double>(json['handlingFee']);
  if (handlingFee != null) {
    readyApplyCashEntity.handlingFee = handlingFee;
  }
  final double? amountReceived = jsonConvert.convert<double>(
      json['amountReceived']);
  if (amountReceived != null) {
    readyApplyCashEntity.amountReceived = amountReceived;
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
  final int? verifyNum = jsonConvert.convert<int>(json['verifyNum']);
  if (verifyNum != null) {
    readyApplyCashEntity.verifyNum = verifyNum;
  }
  final bool? canSubmit = jsonConvert.convert<bool>(json['canSubmit']);
  if (canSubmit != null) {
    readyApplyCashEntity.canSubmit = canSubmit;
  }
  return readyApplyCashEntity;
}

Map<String, dynamic> $ReadyApplyCashEntityToJson(ReadyApplyCashEntity entity) {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['accountName'] = entity.accountName;
  data['accountType'] = entity.accountType;
  data['canCashAmount'] = entity.canCashAmount;
  data['amount'] = entity.amount;
  data['handlingFee'] = entity.handlingFee;
  data['amountReceived'] = entity.amountReceived;
  data['bank'] = entity.bank;
  data['bankChild'] = entity.bankChild;
  data['bankNum'] = entity.bankNum;
  data['certificatesNum'] = entity.certificatesNum;
  data['phone'] = entity.phone;
  data['taxRate'] = entity.taxRate;
  data['verifyCode'] = entity.verifyCode;
  data['verifyNum'] = entity.verifyNum;
  data['canSubmit'] = entity.canSubmit;
  return data;
}

extension ReadyApplyCashEntityExtension on ReadyApplyCashEntity {
  ReadyApplyCashEntity copyWith({
    String? accountName,
    int? accountType,
    double? canCashAmount,
    int? amount,
    double? handlingFee,
    double? amountReceived,
    String? bank,
    String? bankChild,
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
      ..accountType = accountType ?? this.accountType
      ..canCashAmount = canCashAmount ?? this.canCashAmount
      ..amount = amount ?? this.amount
      ..handlingFee = handlingFee ?? this.handlingFee
      ..amountReceived = amountReceived ?? this.amountReceived
      ..bank = bank ?? this.bank
      ..bankChild = bankChild ?? this.bankChild
      ..bankNum = bankNum ?? this.bankNum
      ..certificatesNum = certificatesNum ?? this.certificatesNum
      ..phone = phone ?? this.phone
      ..taxRate = taxRate ?? this.taxRate
      ..verifyCode = verifyCode ?? this.verifyCode
      ..verifyNum = verifyNum ?? this.verifyNum
      ..canSubmit = canSubmit ?? this.canSubmit;
  }
}