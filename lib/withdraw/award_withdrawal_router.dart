import 'package:fluro/fluro.dart';
import 'package:saas_flutter_module/router/i_router.dart';
import 'package:saas_flutter_module/withdraw/award_withdrawal_page.dart';
import 'package:saas_flutter_module/withdraw/award_withdrawal_success_page.dart';

class AwardWithdrawalRouter implements IRouterProvider {
  static const String AWARD_WITHDRAWAL_PAGE = '/award_withdrawal/award_withdrawal_page';
  static const String AWARD_WITHDRAWAL_SUCCESS_PAGE = '/award_withdrawal/award_withdrawal_success_page';

  @override
  void initRouter(FluroRouter router) {
    router.define(AWARD_WITHDRAWAL_PAGE,
        handler: Handler(handlerFunc: (_, __) => AwardWithdrawalPage()));
    router.define(AWARD_WITHDRAWAL_SUCCESS_PAGE,
        handler: Handler(handlerFunc: (_, __) => AwardWithdrawalSuccessPage()));
  }
}
