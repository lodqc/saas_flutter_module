import 'package:flutter/material.dart';

import 'colors.dart';
import 'dimens.dart';

class TextStyles {
  static const TextStyle textDarkGray14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_text_gray,
  );
  static const TextStyle text = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.color_FF333333,
    // https://github.com/flutter/flutter/issues/40248
    textBaseline: TextBaseline.alphabetic
  );
  static const TextStyle textDark = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_text,
    textBaseline: TextBaseline.alphabetic
  );

  static const TextStyle textGray12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.text_gray,
    fontWeight: FontWeight.normal
  );
  static const TextStyle textDarkGray12 = TextStyle(
    fontSize: Dimens.font_sp12,
    color: Colours.dark_text_gray,
    fontWeight: FontWeight.normal
  );
  
  static const TextStyle textHint14 = TextStyle(
    fontSize: Dimens.font_sp14,
    color: Colours.dark_unselected_item_color
  );

  static const TextStyle text14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FF333333
  );
  static const TextStyle red14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FFFA5050
  );
  static const TextStyle color_FFC2C2C2_14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FFC2C2C2
  );
  static const TextStyle color_FF222222_18M = TextStyle(
      fontSize: Dimens.font_sp18,
      color: Colours.color_FF222222,fontWeight: FontWeight.w500
  );
  static const TextStyle color_FF222222_20M = TextStyle(
      fontSize: Dimens.font_sp20,
      color: Colours.color_FF222222,fontWeight: FontWeight.w500
  );
  static const TextStyle color_FF222222_28M = TextStyle(
      fontSize: Dimens.font_sp28,
      color: Colours.color_FF222222,fontWeight: FontWeight.w500
  );
  static const TextStyle color_FF222222_16M = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.color_FF222222,fontWeight: FontWeight.w500
  );
  static const TextStyle color_FF222222_14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FF222222
  );
  static const TextStyle color_FF484848_14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FF484848
  );
  static const TextStyle color_FFFF6B00_16N = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.color_FFFF6B00
  );
  static const TextStyle text16N = TextStyle(
      fontSize: Dimens.font_sp16,
      color: Colours.color_FF333333
  );
  static const TextStyle color_FFFFFFFF_14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FFFFFFFF,height: 1.2
  );
  static const TextStyle color_FF333333_14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FF333333,height: 1.2
  );
  static const TextStyle text12N = TextStyle(
      fontSize: Dimens.font_sp12,
      color: Colours.color_FF333333,height: 1.2
  );
  static const TextStyle color_FF888888_14N = TextStyle(
      fontSize: Dimens.font_sp14,
      color: Colours.color_FF888888,height: 1.2
  );
}
