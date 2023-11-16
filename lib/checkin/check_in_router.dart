import 'package:fluro/fluro.dart';
import 'package:saas_flutter_module/checkin/checkin_detail_page.dart';
import 'package:saas_flutter_module/checkin/checkin_page.dart';
import 'package:saas_flutter_module/router/i_router.dart';

class CheckInRouter implements IRouterProvider {
  static String CHECK_IN_PAGE = '/check_in/check_in_page';
  static String CHECK_IN_DETAIL_PAGE = '/check_in/check_in_detail_page';

  @override
  void initRouter(FluroRouter router) {
    router.define(CHECK_IN_PAGE,
        handler: Handler(handlerFunc: (_, __) => CheckInPage()));
    router.define(CHECK_IN_DETAIL_PAGE,
        handler: Handler(handlerFunc: (_, __) => CheckInDetailPage()));
  }
}
