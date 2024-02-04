import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class DeleteInfoButton extends StatefulWidget {
  final String careerName;
  final String acceptionRate;
  final PanelID panelId;


  const DeleteInfoButton({
    super.key,
    required this.panelId,
    required this.careerName,
    required this.acceptionRate,
    });

  @override
  State<DeleteInfoButton> createState() => _DeleteInfoButtonState();
}

class _DeleteInfoButtonState extends State<DeleteInfoButton> {
  @override
  Widget build(BuildContext context) {
    double maxWidth =
        MediaQuery.of(context).size.width - 16 * 2 - 12 * 2 - 12 - 60;

    return Container(
      width: maxWidth,
      margin: EdgeInsets.only(bottom: 12),
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
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: Text(
                    widget.careerName,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12, color: NYColor.formColor("#111111")),
                  )),
              Expanded(
                  flex: 1,
                  child: Text(
                    widget.acceptionRate,
                    softWrap: true,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: TextStyle(
                        fontSize: 12, color: NYColor.formColor("#111111")),
                  )),
            ],
          ),
          Positioned(
              top: -5,
              right: -5,
              child: new Image.asset(
                "assets/icon_delete.png",
                fit: BoxFit.cover,
                width: 16,
                height: 16,
              )),
        ],
      ),
    );
  }
}
