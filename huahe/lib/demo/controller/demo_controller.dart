import 'package:get/get.dart';

import '../data/editor_data.dart';
import '../data/source_data.dart';

///
/// 主要的处理数据的Controller，刷新机会少，没用到局部刷新
/// editorDataList:初始化的数据，后续操作的数据
///
class DemoController extends GetxController {
  List<EditorData> editorDataList = [];

  @override
  void onInit() {
    for (var element in sourceData) {
      editorDataList.add(EditorData.fromMap(element));
    }

    super.onInit();
  }
}
