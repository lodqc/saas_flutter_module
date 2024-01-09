import 'package:flutter/material.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/router/fluro_navigator.dart';
import 'package:saas_flutter_module/util/other_utils.dart';
import 'package:saas_flutter_module/widgets/my_app_bar.dart';
import 'package:saas_flutter_module/widgets/my_scroll_view.dart';
import 'package:saas_flutter_module/widgets/my_text_field.dart';
import 'package:saas_flutter_module/withdraw/award_withdrawal_router.dart';

class AwardWithdrawalPage extends StatefulWidget {
  const AwardWithdrawalPage({super.key});

  @override
  _AwardWithdrawalPageState createState() => _AwardWithdrawalPageState();
}

class _AwardWithdrawalPageState extends State<AwardWithdrawalPage> {
  final TextEditingController _amountController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Container(
        color: Colors.white,
        height: 64,
        child: InkWell(
          child: Container(
            width: double.infinity,
            height: 44,
            margin: EdgeInsets.only(left: 16, top: 12, right: 16),
            decoration: BoxDecoration(
                color: Colours.color_FFC2C2C2,
                borderRadius: BorderRadius.all(Radius.circular(4))),
            child: Center(
              child: Text(
                "提交",
                style: TextStyles.color_FFFFFFFF_14M,
              ),
            ),
          ),
          onTap: () {
            NavigatorUtils.push(
                context, AwardWithdrawalRouter.AWARD_WITHDRAWAL_SUCCESS_PAGE);
          },
        ),
      ),
      body: MyScrollView(
        keyboardConfig:
            Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1]),
        children: [
          Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colours.color_FF75BAFF,
                    Colours.color_FFE8F6FF
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                  height: 224,
                ),
                Container(
                  height: 44 + MediaQuery.of(context).padding.top,
                  child: MyAppBar(
                    title: "提现",
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  child: Text(
                    "可提现金额(元)",
                    style: TextStyles.color_FF484848_14N,
                  ),
                  top: 100,
                ),
                Positioned(
                  child: Text(
                    "1.040.00",
                    style: TextStyles.color_FF222222_28M,
                  ),
                  top: 126,
                ),
                childContainerAmount(),
                childCardInfo(),
                childIll()
              ],
            ),
          )
        ],
      ),
    );
  }

  childContainerAmount() => Container(
        margin: EdgeInsets.only(top: 182),
        width: double.infinity,
        height: 184,
        decoration: BoxDecoration(
            color: Colours.color_FFFFFFFF,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12), topRight: Radius.circular(12))),
        padding: EdgeInsets.only(left: 16, top: 12, right: 16, bottom: 16),
        child: Stack(
          children: [
            Text(
              "提现金额",
              style: TextStyles.color_FF222222_16M,
            ),
            Positioned(
              child: Text(
                "预估手续费",
                style: TextStyles.color_FF888888_14N,
              ),
              bottom: 30,
            ),
            Positioned(
              child: Text(
                "¥ 0.00",
                style: TextStyles.color_FF333333_14N,
              ),
              left: 112,
              bottom: 30,
            ),
            Positioned(
              child: Text(
                "预估到账金额",
                style: TextStyles.color_FF888888_14N,
              ),
              bottom: 0,
            ),
            Positioned(
              child: Text(
                "¥ 0.00",
                style: TextStyles.color_FF333333_14N,
              ),
              left: 112,
              bottom: 0,
            ),
            Container(
              height: 1,
              color: Colours.color_FFF0F0F0,
              margin: EdgeInsets.only(top: 90),
            ),
            Positioned(
              child: Text(
                "¥",
                style: TextStyles.color_FF222222_24M,
              ),
              bottom: 76,
            ),
            Positioned(
              child: Text(
                "全部提现",
                style: TextStyles.color_FFFF6B00_14N,
              ),
              bottom: 81,
              right: 0,
            ),
            Positioned(
              child: MyTextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                hintText: "0.00",
                hintStyle: TextStyles.color_FFC2C2C2_24N,
                style: TextStyles.color_FF222222_24M,
              ),
              left: 23,
              right: 76,
              bottom: 60,
            )
          ],
        ),
      );

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _verifyController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _bankCodeController = TextEditingController();
  final TextEditingController _bankNameController = TextEditingController();
  final TextEditingController _bankOtherNameController =
      TextEditingController();

  childCardInfo() => Container(
        margin: EdgeInsets.only(top: 376),
        width: double.infinity,
        height: 426,
        color: Colors.white,
        padding: EdgeInsets.only(left: 16),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 48,
              child: Text(
                "提现到",
                style: TextStyles.color_FF222222_16M,
              ),
              padding: EdgeInsets.only(top: 12),
            ),
            itemCardInfo(
                "收款人", "填写账户开户人姓名", _nameController, 6, TextInputType.text),
            itemCardInfo("手机号码", "填写开户时预留的手机号", _phoneController, 11,
                TextInputType.number),
            itemCardInfo(
                "验证码", "填写短信验证码", _verifyController, 4, TextInputType.number,
                isRight: true),
            itemCardInfo("身份证号", "填写居民身份证号", _codeController, 18,
                TextInputType.emailAddress),
            itemCardInfo("银行卡号", "填写银行卡号", _bankCodeController, 19,
                TextInputType.number),
            itemCardInfo("银行名称", "例如 中国建设银行", _bankNameController, 10,
                TextInputType.text),
            itemCardInfo("支行名称", "例如 深圳市分行高新园支行营业部", _bankOtherNameController,
                16, TextInputType.text),
          ],
        ),
      );

  itemCardInfo(String name, String hint, TextEditingController controller,
          int maxLength, TextInputType keyboardType,
          {bool isRight = false}) =>
      Container(
        width: double.infinity,
        height: 54,
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colours.color_FFF0F0F0))),
        child: Row(
          children: [
            Text(
              name,
              style: TextStyles.color_FF333333_14N,
            ),
            Padding(padding: EdgeInsets.only(left: 38)),
            Flexible(
              child: MyTextField(
                controller: controller,
                keyboardType: keyboardType,
                hintText: hint,
                maxLength: maxLength,
                hintStyle: TextStyles.color_FFC2C2C2_14N,
                style: TextStyles.color_FF333333_14N,
              ),
            ),
            Visibility(
              child: Text(
                "获取验证码",
                style: TextStyles.color_FFFF6B00_14N,
              ),
              visible: isRight,
            )
          ],
        ),
      );

  childIll() => Container(
      width: double.infinity,
      height: 200,
      margin: EdgeInsets.only(top: 802),
      child: Stack(
        children: [
          Positioned(
            child: Text(
              "说明：",
              style: TextStyles.color_FF222222_14M,
            ),
            top: 20,
            left: 16,
          ),
          Positioned(
            child: Text(
              "提现周期：",
              style: TextStyles.color_FF888888_14N,
            ),
            top: 50,
            left: 16,
          ),
          Positioned(
            child: Text(
              "审核通过后 T+1 到账",
              style: TextStyles.color_FF333333_14N,
            ),
            top: 50,
            left: 86,
          ),
          Positioned(
            child: Text(
              "手续费：",
              style: TextStyles.color_FF888888_14N,
            ),
            top: 76,
            left: 16,
          ),
          Positioned(
            child: Text(
              "按国家有关规定缴纳6%的税率",
              style: TextStyles.color_FF333333_14N,
            ),
            top: 76,
            left: 86,
          ),
        ],
      ));
}
