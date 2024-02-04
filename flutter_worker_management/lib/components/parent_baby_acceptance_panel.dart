// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/add_info_button.dart';
import 'package:flutter_worker_management/components/delete_info_button.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/components/mutable_info_panel.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class ParentBabyAcceptancePanel extends StatefulWidget {
  final PanelID panelId;
  final String panelTitle;
  VoidCallback? editButtonDidTap;
  List<Map<String, String>>? parentAcceptanceList;

  ParentBabyAcceptancePanel({
    super.key,
    required this.panelId,
    required this.panelTitle,
    required this.parentAcceptanceList,
    this.editButtonDidTap,
  });

  @override
  State<ParentBabyAcceptancePanel> createState() => _ParentBabyAcceptancePanelState();
}

class _ParentBabyAcceptancePanelState extends State<ParentBabyAcceptancePanel> {
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
            width: 60,
            child: Text(
              widget.panelTitle,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12, color: NYColor.formColor("#111111")),
            ),
          ),
          Expanded(flex: 1, child: Container()),
          MutableInfoPanel(parentAcceptanceList: widget.parentAcceptanceList, panelId: widget.panelId,),
        ],
      ),
    );
  }
}
