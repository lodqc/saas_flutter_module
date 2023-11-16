import 'package:flutter/material.dart';
import 'package:saas_flutter_module/res/resources.dart';

class ClickItem88 extends StatelessWidget {
  const ClickItem88(
      {super.key,
      this.onTap,
      required this.title,
      this.content = '',
      this.textAlign = TextAlign.start,
      this.isLocal = true,
      this.maxLines = 1});

  final GestureTapCallback? onTap;
  final String title;
  final String content;
  final TextAlign textAlign;
  final int maxLines;
  final bool isLocal;

  @override
  Widget build(BuildContext context) {
    Widget child = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          //为了数字类文字居中
          crossAxisAlignment: maxLines == 1
              ? CrossAxisAlignment.center
              : CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyles.text14N,
            ),
            Padding(
              padding: EdgeInsets.only(left: 4),
              child: Text(
                "*",
                style: TextStyles.red14N,
              ),
            ),
            const Spacer(),
            Visibility(
              child: Padding(
                padding: EdgeInsets.only(top: maxLines == 1 ? 0.0 : 2.0),
                child: Images.locationRight,
              ),
              visible: isLocal,
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(top: 12),
          child: Text(
            content,
            maxLines: maxLines,
            textAlign: maxLines == 1 ? TextAlign.right : textAlign,
            overflow: TextOverflow.ellipsis,
            style: TextStyles.color_FFC2C2C2_14N,
          ),
        )
      ],
    );

    /// 分隔线
    child = Container(
      margin: const EdgeInsets.only(left: 15.0),
      padding: const EdgeInsets.fromLTRB(0, 15.0, 15.0, 15.0),
      constraints: const BoxConstraints(
        minHeight: 88,
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border(
          bottom: Divider.createBorderSide(context, width: 0.6),
        ),
      ),
      child: child,
    );

    return InkWell(
      onTap: onTap,
      child: child,
    );
  }
}
