import 'package:flutter/widgets.dart';
import 'package:saas_flutter_module/widgets/load_image.dart';

export 'colors.dart';
export 'dimens.dart';
export 'gaps.dart';
export 'styles.dart';

class Images {
  static const Widget arrowRight = LoadAssetImage('ic_arrow_right', height: 24, width: 24);
  static const Widget scanRight = LoadAssetImage('ic_scan_right', height: 20, width: 20);
  static const Widget locationRight = LoadAssetImage('ic_location_right', height: 20, width: 20);
  static const Widget imgAdd = LoadAssetImage('ic_img_add', height: 32, width: 32,);
  static const Widget imgUncheck = LoadAssetImage('ic_item_uncheck', height: 20, width: 20,);
  static const Widget icItem0 = LoadAssetImage('ic_item_0', height: 20, width: 20,);
  static const Widget imgCheck = LoadAssetImage('ic_item_check', height: 20, width: 20,);
  static const Widget imgHead = LoadAssetImage('ic_head_icon', height: 40, width: 40,);
}
