import 'package:flutter/material.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/router/fluro_navigator.dart';

class AwardWithdrawalSuccessPage extends StatelessWidget {
  const AwardWithdrawalSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(top: 140)),
            Images.imgSuccess,
            Gaps.vGap24,
            Text(
              "您的提现申请已提交",
              style: TextStyles.color_FF222222_18M,
            ),
            Gaps.vGap8,
            Text(
              "资金变动情况请留意您的银行卡账户",
              style: TextStyles.color_FF888888_14N,
            ),
            Padding(padding: EdgeInsets.only(top: 80)),
            InkWell(
              child: Container(
                width: double.infinity,
                height: 44,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(4)),
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Center(
                  child: Text(
                    "返回",
                    style: TextStyles.color_FFFFFFFF_14M,
                  ),
                ),
              ),
              onTap: () {
                NavigatorUtils.goBack(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
