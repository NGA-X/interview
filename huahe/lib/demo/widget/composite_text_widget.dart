import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../data/editor_data.dart';

///
/// 组合文本组件
/// data:显示内容
/// onTap:点击事件
/// onTapAdd:添加事件
///
class CompositeTextWidget extends StatefulWidget {
  final EditorData data;
  final VoidCallback onTap;
  final VoidCallback onTapAdd;

  const CompositeTextWidget({
    super.key,
    required this.data,
    required this.onTap,
    required this.onTapAdd,
  });

  @override
  State<CompositeTextWidget> createState() => _CompositeTextWidgetState();
}

class _CompositeTextWidgetState extends State<CompositeTextWidget> {
  @override
  Widget build(BuildContext context) {
    // 按照模板的顺序，将每个value合并
    List<List<String>> contentList = [];
    var ids = widget.data.templates.map((template) => template.id).toList();
    // 遍历每个value，插入对应组件
    for (var value in widget.data.values) {
      contentList.add(ids.map((id) => value[id] ?? ' ').toList());
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 10),
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
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Text(widget.data.title),
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                for (var (index, element) in contentList.indexed)
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 5,
                            top: 5,
                            bottom: 5,
                          ),
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
                                children: [
                                  for (final piece in element)
                                    Expanded(
                                      child: Center(
                                        child: ConstrainedBox(
                                          constraints: const BoxConstraints(
                                              maxWidth: 100),
                                          child: Text(piece),
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          top: 0,
                          width: 16,
                          height: 16,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                widget.data.values.removeAt(index);
                              });
                            },
                            child: Image.asset('images/icon_delete.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                GestureDetector(
                  onTap: widget.onTapAdd,
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 5,
                      top: 5,
                      bottom: 5,
                    ),
                    child: DottedBorder(
                      dashPattern: const [8, 4],
                      strokeWidth: 1,
                      color: const Color(0xFF007FFF),
                      borderType: BorderType.RRect,
                      radius: const Radius.circular(8),
                      child: Container(
                        width: double.infinity,
                        height: 32,
                        color: const Color(0x19007FFF),
                        child: const Center(
                          child: Icon(
                            Icons.add,
                            color: Color(0xFF007FFF),
                            size: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
