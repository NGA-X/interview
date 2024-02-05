import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../data/editor_data.dart';

///
/// 拼接文本组件
/// data:显示内容
/// onTap:点击事件
///
class SpliceTextWidget extends StatelessWidget {
  final EditorData data;
  final VoidCallback onTap;

  const SpliceTextWidget({
    super.key,
    required this.data,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    var titles = data.templates.map((template) => template.title).join('/');

    //按照模板的顺序，将每个value合并
    var values = '';
    var ids = data.templates.map((template) => template.id).toList();
    if (data.values.isNotEmpty) {
      values = ids.map((id) => data.values.single[id] ?? ' ').join('/');
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
              child: Text(data.title),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(titles),
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
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 8,
                  ),
                  color: const Color(0x19007FFF),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 200),
                        child: Text(values),
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
