import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:saas_flutter_module/bean/login_body_bean.dart';
import 'package:saas_flutter_module/bean/login_entity.dart';
import 'package:saas_flutter_module/net/dio_utils.dart';

final myProvider = FutureProvider.autoDispose((ref) async {
  // An object from package:dio that allows cancelling http requests
  final cancelToken = CancelToken();
  // When the provider is destroyed, cancel the http request
  ref.onDispose(() => cancelToken.cancel());
  // Fetch our data and pass our `cancelToken` for cancellation to work
  final response = await DioUtils.instance.requestNetwork<LoginEntity>(
    Method.post,
    "cloud_manage/login",params: LoginBodyBean(platId: 1,userName: '18138819493@swap.com',pwd: 'e10adc3949ba59abbe56e057f20f883e'),
    cancelToken: cancelToken,
  );
  // If the request completed successfully, keep the state
  ref.keepAlive();
  return response;
});
