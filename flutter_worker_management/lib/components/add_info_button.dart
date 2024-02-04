import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class AddInfoButton extends StatelessWidget {
  final PanelID panelId;
  VoidCallback? addButtonDidTap;

  AddInfoButton({
    super.key,
    required this.panelId,
    this.addButtonDidTap,
  });

  @override
  Widget build(BuildContext context) {
    double maxWidth =
        MediaQuery.of(context).size.width - 16 * 2 - 12 * 2 - 12 - 60;

    return Container(
      width: maxWidth,
      height: 32,
      child: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          DottedBorder(
            color: NYColor.fontColor(),
            borderType: BorderType.RRect,
            radius: Radius.circular(4),
            padding: EdgeInsets.all(0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(4)),
              child: Container(
                color: NYColor.fontColorAlpha(0.1),
              ),
            ),
          ),
          Icon(
            Icons.add,
            size: 16,
            color: NYColor.fontColor(),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: maxWidth,
            height: 32,
            child: GestureDetector(onTap: addButtonDidTap),
          )
        ],
      ),
    );
  }
}
