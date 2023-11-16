import 'package:flutter/material.dart';
import 'package:saas_flutter_module/res/colors.dart';
import 'package:saas_flutter_module/res/dimens.dart';

/// 默认字号18，白字蓝底，高度48
class MyButton extends StatelessWidget {

  const MyButton({
    super.key,
    this.text = '',
    this.fontSize = Dimens.font_sp14,
    this.textColor,
    this.disabledTextColor,
    this.backgroundColor,
    this.disabledBackgroundColor,
    this.minHeight = 44,
    this.minWidth = double.infinity,
    this.padding = const EdgeInsets.symmetric(horizontal: 16.0),
    this.radius = 4,
    this.side = BorderSide.none,
    this.onPressed,
  });

  final String text;
  final double fontSize;
  final Color? textColor;
  final Color? disabledTextColor;
  final Color? backgroundColor;
  final Color? disabledBackgroundColor;
  final double? minHeight;
  final double? minWidth;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final double radius;
  final BorderSide side;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        // 文字颜色
        foregroundColor: MaterialStateProperty.resolveWith((states) {
            return textColor ?? Colors.white;
          },
        ),
        // 背景颜色
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          if (onPressed == null) {
            return disabledBackgroundColor ?? Colours.button_disabled;
          }
          return backgroundColor ?? Colours.button_enable;
        }),
        // 水波纹
        overlayColor: MaterialStateProperty.resolveWith((states) {
          return (textColor ?? Colors.white.withOpacity(0.12));
        }),
        // 按钮最小大小
        minimumSize: (minWidth == null || minHeight == null) ? null : MaterialStateProperty.all<Size>(Size(minWidth!, minHeight!)),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(padding),
        shape: MaterialStateProperty.all<OutlinedBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
        side: MaterialStateProperty.all<BorderSide>(side),
      ),
      child: Text(text, style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w500),)
    );
  }
}
