import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../data/editor_data.dart';

///
/// 单行文本组件
/// data:显示内容
/// onTap:点击事件
///
class SimpleTextWidget extends StatelessWidget {
  final EditorData data;
  final VoidCallback onTap;

  const SimpleTextWidget({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var template = data.templates.single;
    var title = template.title;

    var value = '';
    if (data.values.isNotEmpty) {
      value = data.values.single[template.id] ?? '';
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 19),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xFFE1E1E1),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(title),
            ),
          ),
          GestureDetector(
            onTap: onTap,
            child: Container(
              margin: const EdgeInsets.only(left: 20, right: 5),
              child: DottedBorder(
                dashPattern: const [8, 4],
                strokeWidth: 1,
                color: const Color(0xFF007FFF),
                borderType: BorderType.RRect,
                radius: const Radius.circular(8),
                child: Container(
                  constraints: const BoxConstraints(minWidth: 68),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  color: const Color(0x19007FFF),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Text(value),
                      ),
                      Image.asset(
                        'images/icon_text_editor.png',
                        width: 16,
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
