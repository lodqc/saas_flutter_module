import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:saas_flutter_module/checkin/check_in_router.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/router/fluro_navigator.dart';
import 'package:saas_flutter_module/util/other_utils.dart';
import 'package:saas_flutter_module/widgets/my_app_bar.dart';
import 'package:saas_flutter_module/widgets/my_button.dart';
import 'package:saas_flutter_module/widgets/my_scroll_view.dart';
import 'package:saas_flutter_module/widgets/my_text_field.dart';

class CheckInPage extends StatefulWidget {
  CheckInPage({Key? key}) : super(key: key);

  @override
  _CheckInPageState createState() => _CheckInPageState();
}

class _CheckInPageState extends State<CheckInPage> {
  final TextEditingController _snController = TextEditingController();
  final FocusNode _nodeText1 = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyScrollView(
        keyboardConfig:
        Utils.getKeyboardActionsConfig(context, <FocusNode>[_nodeText1]),
        children: [
          Container(
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Colours.color_FF75BAFF,
                        Colours.color_FFE8F6FF
                      ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter)),
                  height: 224,
                ),
                Container(
                  height: 44 + MediaQuery
                      .of(context)
                      .padding
                      .top,
                  child: MyAppBar(
                    title: "巡检打卡",
                    backgroundColor: Colors.transparent,
                  ),
                ),
                Positioned(
                  child: Images.ic_check_in_0,
                  right: 28,
                  top: 72,
                ),
                Positioned(
                  child: Images.imgHead,
                  left: 20,
                  top: 108,
                ),
                Positioned(
                  child: Text(
                    "叶大钊",
                    style: TextStyles.color_FF222222_20M,
                  ),
                  left: 72,
                  top: 114,
                ),
                Positioned(
                  child: Text(
                    "深圳市",
                    style: TextStyles.text12N,
                  ),
                  left: 140,
                  top: 122,
                ),
                Container(
                  height: 160,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 192),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  child: Stack(
                    children: [
                      Positioned(
                        child: Text(
                          "已巡检电柜台数",
                          style: TextStyles.color_FF222222_16M,
                        ),
                        left: 16,
                        top: 12,
                      ),
                      Positioned(
                        child: InkWell(
                          child: Row(
                            children: [
                              Text(
                                "查询打卡明细",
                                style: TextStyles.color_FF888888_14N,
                              ),
                              Images.arrowRight
                            ],
                          ),
                          onTap: () {
                            NavigatorUtils.push(
                                context, CheckInRouter.CHECK_IN_DETAIL_PAGE);
                          },
                        ),
                        right: 8,
                        top: 12,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colours.color_FFF7F7F7, width: 10))),
                        child: Row(
                          children: [
                            Expanded(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.expand(),
                                child: Stack(
                                  alignment:
                                  Alignment.center, //指定未定位或部分定位widget的对齐方式
                                  children: <Widget>[
                                    Positioned(
                                      top: 24,
                                      child: Text(
                                        "48",
                                        style: TextStyles.color_FF222222_28M,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      child: Text("本月打卡电柜",
                                          style: TextStyles.color_FF484848_14N),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1,
                            ),
                            Container(
                              color: Colours.color_FFF0F0F0,
                              width: 1,
                              height: 48,
                            ),
                            Expanded(
                              child: ConstrainedBox(
                                constraints: BoxConstraints.expand(),
                                child: Stack(
                                  alignment:
                                  Alignment.center, //指定未定位或部分定位widget的对齐方式
                                  children: <Widget>[
                                    Positioned(
                                      top: 24,
                                      child: Text(
                                        "7",
                                        style: TextStyles.color_FF222222_28M,
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 20,
                                      child: Text("今日打卡电柜",
                                          style: TextStyles.color_FF484848_14N),
                                    )
                                  ],
                                ),
                              ),
                              flex: 1,
                            )
                          ],
                        ),
                        height: 112,
                        margin: EdgeInsets.only(top: 48),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 352),
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "巡检打卡",
                        style: TextStyles.color_FF222222_16M,
                      ),
                      Container(
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    color: Colours.color_FF333333, width: 1))),
                        margin: EdgeInsets.only(left: 8, top: 68, right: 8),
                        child: Row(
                          children: [
                            Text(
                              "电柜SN ",
                              style: TextStyles.color_FF333333_14N,
                            ),
                            Text(
                              "*",
                              style: TextStyles.red14N,
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Expanded(
                              child: MyTextField(
                                controller: _snController,
                                keyboardType: TextInputType.number,
                                hintText: "扫电柜码或输入电柜SN",
                              ),
                              flex: 1,
                            ),
                            Images.ic_check_in_1
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8, right: 8, top: 27),
                        child: MyButton(
                          text: "确定打卡",
                          onPressed: () async {
                            bool? confirm = await showListDialog();
                            print("fq:$confirm");
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 12, left: 8),
                        child: Row(
                          children: [
                            Images.ic_check_in_2,
                            Padding(
                              padding: EdgeInsets.only(left: 4),
                              child: Text(
                                "广东深圳市南山区深圳前海大道前海嘉里中心2栋",
                                style: TextStyles.text12N,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> showListDialog() {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            child: Container(
              width: 311,
              height: 318,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colours.color_FFFFFFFF),
              child: Column(
                children: [
                  Images.ic_check_in_3,
                  Padding(
                    padding: EdgeInsets.only(top: 24),
                    child: Text(
                      "打卡成功！",
                      style: TextStyles.color_FF222222_18M,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Text(
                      "今日已完成该电柜巡检。",
                      style: TextStyles.color_FF333333_14N,
                    ),
                  ),
                  Visibility(
                    child: Text(
                      "电柜SN：S0200BT22900002",
                      style: TextStyles.color_FF333333_14N,
                    ),
                    visible: true,
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(),
                  ),
                  InkWell(
                    child: Container(
                      width: 311,
                      height: 56,
                      decoration: BoxDecoration(
                          border: Border(
                              top: BorderSide(
                                  color: Colours.color_FFF0F0F0, width: 1))),
                      child: Center(
                        child: Text(
                          "确认",
                          style: TextStyles.text16N,
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                  )
                ],
              ),
            ));
      },
    );
  }
}
