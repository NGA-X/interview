import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class InputTextItem extends StatelessWidget {
  final KeyboardConfig config;
  InputTextItem({super.key, required this.config});
  TextEditingController _controller = TextEditingController();
  String inputValue() {
    return _controller.text;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                config.keyboardTitle,
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ),
          TextField(
            controller: _controller,
            keyboardType: config.type,
          ),
        ],
      ),
    );
  }
}