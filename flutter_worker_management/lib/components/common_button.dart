import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class CommonButton extends StatelessWidget {
  final String text;
  Function()? onPressed;
  CommonButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 237,
        height: 45,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: NYColor.fontColor(),
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Text(
              "确定",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            Center(
              child: GestureDetector(
                onTap: onPressed,
              ),
            ),
          ],
        ));
  }
}
