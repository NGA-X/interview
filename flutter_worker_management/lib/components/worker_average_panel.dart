// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class WorkerAveragePanel extends StatefulWidget {
  final String panelTitle;
  final String panelDetail;
  final PanelID panelId;

  Function(PanelID panelId)? editButtonDidTap;

  WorkerAveragePanel({
    super.key,
    required this.panelTitle,
    required this.panelDetail,
    required this.panelId,
    this.editButtonDidTap,
  });

  @override
  State<WorkerAveragePanel> createState() => _WorkerAveragePanelState();
}

class _WorkerAveragePanelState extends State<WorkerAveragePanel> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: NYColor.lineColor())),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 155,
            child: Text(
              widget.panelTitle,
              textAlign: TextAlign.left,
              style:
                  TextStyle(fontSize: 12, color: NYColor.formColor("#111111")),
            ),
          ),
          Expanded(
            child: Container(),
            flex: 1,
          ),
          EditInfoButton(
            panelID: widget.panelId,
            acceptionRate: widget.panelDetail,
            editButtonDidTap: () {
              if (widget.editButtonDidTap != null) {
                widget.editButtonDidTap!(widget.panelId);
              }
            },
            maxWidth: 68,
          )
        ],
      ),
    );
  }
}
