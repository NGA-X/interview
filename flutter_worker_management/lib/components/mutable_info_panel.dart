import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/add_info_button.dart';
import 'package:flutter_worker_management/components/delete_info_button.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class MutableInfoPanel extends StatefulWidget {
  // [{"careerName":"aaa", "acceptionRate": "bbb"}]
  List<Map<String, String>>? parentAcceptanceList;
  final PanelID panelId;
  VoidCallback? addButtonDidTap;

  final Function(PanelID panelId, int? itemIndex)? deleteButtonDidtap;
  MutableInfoPanel({
    super.key,
    required this.parentAcceptanceList,
    required this.panelId,
    this.addButtonDidTap,
    this.deleteButtonDidtap,
  });

  @override
  State<MutableInfoPanel> createState() => _MutableInfoPanelState();
}

class _MutableInfoPanelState extends State<MutableInfoPanel> {
  List<Widget> _buildDeleteItems(BuildContext context) {
    List<Widget> widgetList = <Widget>[];
    if (widget.parentAcceptanceList == null) {
      return widgetList;
    }
    List<Map<String, String>> acceptanceList = widget.parentAcceptanceList!;
    for (var i = 0; i < acceptanceList.length; i++) {
      Map<String, String> acceptance = acceptanceList[i];
      Widget item = DeleteInfoButton(
        careerName: acceptance["careerName"] as String,
        acceptionRate: acceptance["acceptionRate"] as String,
        panelId: widget.panelId,
        itemIndex: i,
        deleteButtonDidtap: widget.deleteButtonDidtap,
      );
      widgetList.add(item);
      if (i < acceptanceList.length) {
        double w =
            MediaQuery.of(context).size.width - 16 * 2 - 12 * 2 - 12 - 60;
        Widget line = Container(
          width: w,
          height: 1,
          decoration: BoxDecoration(
            border: Border.all(color: NYColor.lineColor()),
          ),
        );
        widgetList.add(line);
      }
    }
    return widgetList;
  }

  List<Widget> _buildAllItems(BuildContext context) {
    Widget addButton = AddInfoButton(
      panelId: widget.panelId,
      addButtonDidTap: widget.addButtonDidTap,
    );
    List<Widget> widgetList = _buildDeleteItems(context);
    widgetList.add(addButton);
    return widgetList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: _buildAllItems(context)),
    );
  }
}
