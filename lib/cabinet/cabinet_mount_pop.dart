// 弹出底部菜单列表模态对话框
import 'package:flutter/material.dart';
import 'package:saas_flutter_module/res/resources.dart';

/// 选择干系人底部弹窗
Future<List<int>?> showResponsibleBottomSheet(
    BuildContext context, List<String> data) {
  List<int> indexList = [];
  return showModalBottomSheet<List<int>>(
    context: context,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return StatefulBuilder(builder: (context1, setState) {
        return Container(
          child: Column(
            children: [
              Container(
                height: 58,
                child: Row(
                  children: [
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 22, right: 12),
                        child: Text('取消', style: TextStyles.text16N),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    Expanded(
                      child: Center(
                        child:
                            Text("选择干系人", style: TextStyles.color_FF222222_18M),
                      ),
                      flex: 1,
                    ),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 12, right: 22),
                        child: Text('确定', style: TextStyles.color_FFFF6B00_16N),
                      ),
                      onTap: () {
                        Navigator.of(context).pop(indexList);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: 224,
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      child: Container(
                        margin: EdgeInsets.only(left: 16),
                        height: 54,
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(
                                    width: 1, color: Colours.color_FFF0F0F0))),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(data[index],
                                  style: TextStyles.color_FF222222_14N),
                              flex: 1,
                            ),
                            Container(
                              child: indexList.contains(index)
                                  ? Images.imgCheck
                                  : Images.imgUncheck,
                              margin: EdgeInsets.only(right: 18),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          if (indexList.contains(index)) {
                            indexList.remove(index);
                          } else {
                            indexList.add(index);
                          }
                        });
                      },
                    );
                  },
                ),
              )
            ],
          ),
          height: 282,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        );
      });
    },
  );
}
