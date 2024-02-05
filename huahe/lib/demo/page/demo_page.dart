import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huahe/demo/page/demo_editor.dart';
import 'package:huahe/demo/widget/splice_text_widget.dart';

import '../controller/demo_controller.dart';
import '../widget/composite_text_widget.dart';
import '../widget/simple_text_widget.dart';

///
/// 主页面
/// 拥有Controller获取数据源
/// 对数据进行编辑之后，刷新当前页面
/// 处理了组件越界等问题
///
class DemoPage extends StatefulWidget {
  const DemoPage({super.key});

  @override
  State<DemoPage> createState() => _DemoPageState();
}

class _DemoPageState extends State<DemoPage> {
  @override
  void initState() {
    Get.put(DemoController());
    super.initState();
  }

  @override
  void dispose() {
    Get.delete<PageController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DemoController controller = Get.find();

    return Scaffold(
      body: SafeArea(
        child: DefaultTextStyle(
          style: const TextStyle(color: Colors.black, fontSize: 12),
          child: ListView.builder(
            itemCount: controller.editorDataList.length,
            itemBuilder: (context, index) {
              var data = controller.editorDataList[index];
              return switch (data.type) {
                'A' => SpliceTextWidget(
                    data: data,
                    onTap: () async {
                      await Get.to(
                        () => DemoEditor(data: data, index: 0),
                        duration: const Duration(seconds: 0),
                      );
                      setState(() {});
                    },
                  ),
                'B' => SimpleTextWidget(
                    data: data,
                    onTap: () async {
                      await Get.to(
                        () => DemoEditor(data: data, index: 0),
                        duration: const Duration(seconds: 0),
                      );
                      setState(() {});
                    },
                  ),
                'C' => CompositeTextWidget(
                    data: data,
                    onTap: () async {
                      await Get.to(
                        () => DemoEditor(data: data, index: 0),
                        duration: const Duration(seconds: 0),
                      );
                      setState(() {});
                    },
                    onTapAdd: () async {
                      await Get.to(
                        () => DemoEditor(data: data),
                        duration: const Duration(seconds: 0),
                      );
                      setState(() {});
                    },
                  ),
                _ => const Placeholder()
              };
            },
          ),
        ),
      ),
    );
  }
}
