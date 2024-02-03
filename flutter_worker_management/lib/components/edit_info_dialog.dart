import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/common_button.dart';

class EditInfoDialog extends StatelessWidget {
  const EditInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          CommonButton(
              text: "确定",
              onPressed: () {
                print("Tap button");
              })
        ],
      ),
    );
  }
}
