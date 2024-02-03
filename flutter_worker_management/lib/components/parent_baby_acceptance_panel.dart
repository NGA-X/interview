// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class ParentBabyAcceptancePanel extends StatelessWidget {
  final String panelTitle;
  final String acceptionRate;
  VoidCallback? editButtonDidTap;

  ParentBabyAcceptancePanel({
    super.key,
    required this.panelTitle,
    required this.acceptionRate,
    this.editButtonDidTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: NYColor.formColor("#E1E1E1"))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            width: 60,
            child: Text(
              panelTitle,
              textAlign: TextAlign.center,
              style:
                  TextStyle(fontSize: 12, color: NYColor.formColor("#111111")),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: ((context, index) {
                  return Text("data");
                })),
          )
        ],
      ),
    );
  }
}
