import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/bean/center_data_entity.dart';
import 'package:saas_flutter_module/bean/ready_apply_cash_entity.dart';
import 'package:saas_flutter_module/net/dio_utils.dart';

//提现页面状态
class ReadyApplyCashEntityNotifier
    extends StateNotifier<ReadyApplyCashEntity?> {
  ReadyApplyCashEntityNotifier() : super(null);

  init(Function(ReadyApplyCashEntity data) callBack) async {
    if (state == null) {
      var data = await readyApplyCash();
      var entity = await centerData();
      data?.canCashAmount = entity?.canCashAmount;
      state = data;
    }
    callBack(state!);
  }

  //准备提现
  Future<ReadyApplyCashEntity?> readyApplyCash() {
    return DioUtils.instance.providerRequest<ReadyApplyCashEntity>(
      Method.post,
      "cloud_manage/mUserWalletApply/readyApplyCash",
    );
  }

  //我的钱包
  Future<CenterDataEntity?> centerData() {
    return DioUtils.instance.providerRequest<CenterDataEntity>(
      Method.get,
      "cloud_manage/mUserWalletApply/centerData",
    );
  }

  //发送提现短信验证码
  sendCashSms(String phone) {
    DioUtils.instance.providerRequest<Object>(
        Method.post, "cloud_manage/managerWallet/sendCashSmsCode/$phone",
        onSuccess: (data) {
      startTimer();
    });
  }

  //提交
  applyCash(NetSuccessCallback<Object?>? onSuccess) {
    DioUtils.instance.providerRequest<Object>(
        Method.post, "cloud_manage/mUserWalletApply/applyCash",
        params: state, onSuccess: onSuccess);
  }

  void calculate(String text) {
    var mAmount = double.tryParse(text) ?? 0.0;
    var taxRate = state?.taxRate ?? 0.0;
    var amountReceived = mAmount * taxRate;
    var handlingFee = mAmount - amountReceived;
    state = state?.copyWith(
        amount: mAmount,
        handlingFee: handlingFee,
        amountReceived: amountReceived);
  }

  Timer? _timer;

  void startTimer() {
    state?.verifyNum = 60;
    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      int? i = (state?.verifyNum ?? 60) - 1;
      if (i == 0) {
        i = -1;
        _timer?.cancel();
      }
      state = state?.copyWith(verifyNum: i);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void setStatus({
    String? accountName,
    double? amount,
    String? bank,
    String? bankChild,
    String? bankNum,
    String? certificatesNum,
    String? phone,
    String? verifyCode,
  }) {
    state?.amount = amount == null ? state?.amount : amount;
    state?.accountName = accountName == null ? state?.accountName : accountName;
    state?.bank = bank == null ? state?.bank : bank;
    state?.bankChild = bankChild == null ? state?.bankChild : bankChild;
    state?.bankNum = bankNum == null ? state?.bankNum : bankNum;
    state?.certificatesNum =
        certificatesNum == null ? state?.certificatesNum : certificatesNum;
    state?.phone = phone == null ? state?.phone : phone;
    state?.verifyCode = verifyCode == null ? state?.verifyCode : verifyCode;

    bool canSubmit = (state?.amount ?? 0) != 0 &&
        (state?.accountName ?? '') != '' &&
        (state?.bank ?? '') != '' &&
        (state?.bankChild ?? '') != '' &&
        (state?.bankNum ?? '') != '' &&
        (state?.certificatesNum ?? '') != '' &&
        (state?.phone ?? '') != '' &&
        (state?.verifyCode ?? '') != '';
    state = state?.copyWith(canSubmit: canSubmit);
  }
}

final awardWithdrawalProvider =
    StateNotifierProvider<ReadyApplyCashEntityNotifier, ReadyApplyCashEntity?>(
        (ref) {
  return ReadyApplyCashEntityNotifier();
});
