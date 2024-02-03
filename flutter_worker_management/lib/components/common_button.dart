import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CommonButton extends StatelessWidget {
  final String text;
  Function()? onPressed;
  CommonButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        color: Theme.of(context).primaryColor,
        child: Text(text),
      ),
    );
  }
}
