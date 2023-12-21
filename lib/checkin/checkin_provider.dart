import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/bean/login_body_bean.dart';
import 'package:saas_flutter_module/bean/login_entity.dart';
import 'package:saas_flutter_module/net/dio_utils.dart';

final loginNetProvider = FutureProvider.autoDispose((ref)  async {
  final cancelToken = CancelToken();
  ref.onDispose(() => cancelToken.cancel());
  final response = await DioUtils.instance.requestNetwork<LoginEntity>(
    Method.post,
    "cloud_manage/login",
    params: LoginBodyBean(
        platId: 1,
        userName: '18138819493@swap.com',
        pwd: 'e10adc3949ba59abbe56e057f20f883e'),
    cancelToken: cancelToken,
  );
  ref.keepAlive();
  return response;
});

final loginStateProvider =
    StateNotifierProvider.autoDispose<LoginNotifier, LoginEntity?>((ref) {
  var notifier = LoginNotifier(null);
  ref.watch(loginNetProvider).when(
      data: (login) {
        notifier.onSuccess(login);
      },
      error: (err, stack) => {},
      loading: () => {});
  return notifier;
});

class LoginNotifier extends StateNotifier<LoginEntity?> {
  LoginNotifier(super.state);
  void onSuccess(login) {
    state = login;
  }
}
