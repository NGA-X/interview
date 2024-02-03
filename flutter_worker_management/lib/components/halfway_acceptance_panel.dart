import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worker_management/utils/ny_color.dart';

class HalfwalAcceptancePanel extends StatelessWidget {
  final String panelTitle;
  final String panelDiscription;

  HalfwalAcceptancePanel({
    super.key,
    required this.panelTitle,
    required this.panelDiscription,
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: NYColor.formColor("#E1E1E1"),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            panelTitle,
          ),
          Text(
            panelDiscription,
          ),
          
        ],
      ),
    );
  }
}
