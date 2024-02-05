///
/// Template
/// 模板数据类型，用做前后端数据分离，保证数据安全
///
class Template {
  String id; //模板ID
  String title; //标题
  String unit; //符号
  String hintText; //水印文案
  String showPrompt; //是否显示提示'*'

  bool get isShowPrompt {
    return showPrompt == '1';
  }

  Template.fromMap(Map<String, String> entity)
      : title = entity['title'] ?? '',
        id = entity['id'] ?? '',
        unit = entity['unit'] ?? '',
        hintText = entity['hintText'] ?? '',
        showPrompt = entity['showPrompt'] ?? '';
}

///
/// EditorData
/// 编辑数据，用于包装逻辑相同的一组可编辑的数据。
/// 用做前后端数据分离，保证数据安全
///
class EditorData {
  String id; //ID
  String title; //标题
  String type; //类型
  List<Template> templates = [];
  List<Map<String, String>> values = [];

  EditorData.fromMap(Map<String, dynamic> map)
      : id = map['id'] ?? '',
        title = map['title'] ?? '',
        type = map['type'] ?? '' {
    var templatesList = map['templates'];
    for (var template in templatesList) {
      templates.add(Template.fromMap(template));
    }
    var valuesList = map['values'];
    for (var value in valuesList) {
      values.add(value);
    }
  }
}
