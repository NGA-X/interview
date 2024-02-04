// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class HalfwalAcceptancePanel extends StatefulWidget {
  final PanelID panelId;
  final String panelTitle;
  final String panelDiscription;
  final String acceptionRate;
  Function(PanelID panelId)? editButtonDidTap;

  HalfwalAcceptancePanel({
    super.key,
    required this.panelId,
    required this.panelTitle,
    required this.panelDiscription,
    required this.acceptionRate,
    this.editButtonDidTap,
  });

  @override
  State<HalfwalAcceptancePanel> createState() => _HalfwalAcceptancePanelState();
}

class _HalfwalAcceptancePanelState extends State<HalfwalAcceptancePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: NYColor.lineColor())),
      height: 66,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 60,
            child: Text(
              widget.panelTitle,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12, color: NYColor.formColor("#111111")),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              widget.panelDiscription,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12, color: NYColor.formColor("#111111")),
            ),
          ),
          EditInfoButton(
            panelID: widget.panelId,
            acceptionRate: widget.acceptionRate,
            editButtonDidTap: () {
              if (widget.editButtonDidTap != null) {
                widget.editButtonDidTap!(widget.panelId);
              }
            },
          )
        ],
      ),
    );
  }
}
