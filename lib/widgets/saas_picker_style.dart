import 'package:flutter/material.dart';
import 'package:flutter_pickers/style/picker_style.dart';
import 'package:saas_flutter_module/res/resources.dart';

class SaasPickerStyle extends PickerStyle {
  SaasPickerStyle({bool haveRadius = true, String? title = "选择城市"}) {
    if (haveRadius) {
      this.headDecoration = BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)));
    }
    if (title != null && title != '') {
      this.title = Center(child: Text(title, style: TextStyles.color_FF222222_18M));
    }

    this.commitButton = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 12, right: 22),
      child: Text('确定', style: TextStyles.color_FFFF6B00_16N),
    );

    this.cancelButton = Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(left: 22, right: 12),
      child: Text('取消', style: TextStyles.text16N),
    );

    this.textSize = 16;
    this.textColor = Colours.color_FF222222;
  }
}