import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/editor_data.dart';

///
/// 编辑页面
/// 对于每一种类型的数据统一处理
/// 处理之后更新统一的数据源
///
class DemoEditor extends StatefulWidget {
  final EditorData data;
  final int? index;

  const DemoEditor({
    super.key,
    required this.data,
    this.index,
  });

  @override
  State<DemoEditor> createState() => _DemoEditorState();
}

class _DemoEditorState extends State<DemoEditor> {
  List<TextEditingController> controllers = [];

  double get gradientLevel => widget.data.title.isNotEmpty ? 0.2 : 0.3;

  @override
  void initState() {
    if (widget.index != null && widget.index! < widget.data.values.length) {
      for (var element in widget.data.templates) {
        var controller = TextEditingController();
        var text = widget.data.values[widget.index!][element.id] ?? '';
        if (element.unit.isNotEmpty) {
          text = text.replaceAll(element.unit, '');
        }
        controller.text = text;
        controllers.add(controller);
      }
    } else {
      controllers = List.generate(
        widget.data.templates.length,
        (index) => TextEditingController(),
      );
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Editor'),
      ),
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.all(
              Radius.circular(20),
            ),
            gradient: LinearGradient(
              colors: [Colors.lightBlueAccent.withOpacity(0.1), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0, gradientLevel],
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              buildTitle(),
              for (var (index, element) in widget.data.templates.indexed)
                buildTemplate(element, controllers[index]),
              buildSubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTitle() {
    return widget.data.title.isNotEmpty
        ? Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                widget.data.title,
                style: const TextStyle(fontSize: 18),
              ),
            ),
          )
        : const SizedBox(
            height: 20,
          );
  }

  Widget buildSubmitButton() {
    return GestureDetector(
      onTap: () {
        var ids = widget.data.templates.map((template) => template.id).toList();
        var values = controllers.map((controller) => controller.text).toList();
        assert(ids.length == values.length, 'ids.length != values.length');

        for (var value in values) {
          if (value.isEmpty) {
            Get.snackbar(
              '提示',
              '请输入完整内容！',
            );
            setState(() {});
            return;
          }
        }

        Map<String, String> map = {};
        for (var (index, element) in ids.indexed) {
          map[element] = values[index] + widget.data.templates[index].unit;
        }

        if (widget.index == null) {
          // 新建
          widget.data.values.add(map);
        } else {
          widget.data.values[widget.index!] = map;
        }

        Get.back();
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        margin: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 40),
        decoration: BoxDecoration(
          color: const Color(0xFF007FFF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Center(
          child: Text(
            '确定',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ),
    );
  }

  Widget buildTemplate(Template template, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.all(8.0),
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: (template.isShowPrompt && controller.text.isEmpty)
                      ? '* '
                      : '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
                TextSpan(
                  text: template.title +
                      (template.unit.isEmpty ? '' : '(単位：${template.unit})'),
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF7F7F7),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              hintText: template.hintText,
              contentPadding: const EdgeInsets.all(10),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
