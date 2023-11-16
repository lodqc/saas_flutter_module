import 'package:flutter/material.dart';
import 'package:flutter_pickers/pickers.dart';
import 'package:saas_flutter_module/cabinet/cabinet_mount_pop.dart';
import 'package:saas_flutter_module/res/resources.dart';
import 'package:saas_flutter_module/widgets/click_item.dart';
import 'package:saas_flutter_module/widgets/click_item_88.dart';
import 'package:saas_flutter_module/widgets/my_app_bar.dart';
import 'package:saas_flutter_module/widgets/my_button.dart';
import 'package:saas_flutter_module/widgets/my_scroll_view.dart';
import 'package:saas_flutter_module/widgets/saas_picker_style.dart';

/// design/7店铺-店铺配置/index.html#artboard17
class CabinetMountPage extends StatefulWidget {
  const CabinetMountPage({super.key});

  @override
  _CabinetMountPageState createState() => _CabinetMountPageState();
}

class _CabinetMountPageState extends State<CabinetMountPage> {
  List locations1 = ['', ''];
  List<String> data = ['叶大钊', '李雪', '欧阳锦绣', '陈晓冬', '陈晓天', '陈晓楠'];
  String initData = 'PHP';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // 防止键盘弹出，提交按钮升起。。。
        resizeToAvoidBottomInset: false,
        appBar: const MyAppBar(
          title: "换电柜上架",
        ),
        body: MyScrollView(
          padding: const EdgeInsets.only(bottom: 16),
          children: <Widget>[
            Gaps.divider10,
            ClickItem(
              title: '电柜SN',
              content: "扫电柜码或输入电柜SN",
              onTap: () {},
              isScan: true,
            ),
            Gaps.divider10,
            ClickItem(
              title: '干系人',
              content: '选择干系人',
              onTap: () async {
                var list = await showResponsibleBottomSheet(context,data);
                print(list);
              },
            ),
            ClickItem(
              title: '归属城市',
              content: '选择城市',
              onTap: () {
                Pickers.showAddressPicker(
                  context,
                  pickerStyle: SaasPickerStyle(),
                  initProvince: locations1[0],
                  initCity: locations1[1],
                  // initTown: null,
                  onConfirm: (p, c, t) {
                    setState(() {
                      locations1[0] = p;
                      locations1[1] = c;
                    });
                  },
                );
              },
            ),
            ClickItem88(
              title: '电柜地址',
              content: '选择地址',
            ),
            ClickItem88(
              title: '经纬度',
              content: '电池位置经纬度',
              isLocal: false,
            ),
            Gaps.divider10,
            ClickItem(
              title: '充电器最大功率',
              content: '未设置',
              onTap: () {},
            ),
            ClickItem(
              title: '充电总功率',
              content: '未设置',
              onTap: () {},
            ),
            ClickItem(
              title: '设备音量',
              content: '未设置',
              onTap: () {},
            ),
            ClickItem(
              title: '照明灯控制',
              content: '未设置',
              isShowStar: false,
              onTap: () {},
            ),
            ClickItem(
              title: '最大充电电流',
              content: '未设置',
              onTap: () {},
            ),
            ClickItem(
              title: '风扇触发温度',
              content: '未设置',
              isShowStar: false,
              onTap: () {},
            ),
            Gaps.divider10,
            Container(
              margin: const EdgeInsets.only(left: 15.0),
              padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
              width: double.infinity,
              height: 288,
              child: Column(
                children: [
                  Row(
                    children: <Widget>[
                      Text(
                        "照片",
                        style: TextStyles.text14N,
                      ),
                      const Spacer(),
                      Text("4/5", style: TextStyles.color_FFC2C2C2_14N)
                    ],
                  ),
                  Container(
                    height: 222,
                    margin: EdgeInsets.only(top: 12),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3, //每行三列
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                      ),
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                              color: Colours.color_FFF7F7F7,
                              border: Border.all(
                                  color: Colours.color_FFD9D9D9, width: 0.5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4))),
                          child: Center(
                            child: Images.imgAdd,
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
            Gaps.divider20,
          ],
          bottomButton: Padding(
            padding:
                const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 8.0),
            child: MyButton(
              text: '提交',
            ),
          ),
        ));
  }
}
