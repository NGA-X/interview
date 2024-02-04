import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/common_button.dart';
import 'package:flutter_worker_management/components/input_item.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class EditInfoDialog extends StatefulWidget {
  DialogConfig config;
  final PanelID panelId;
  Function(List values, PanelID panelID)? finishInputValues;

  EditInfoDialog({
    super.key,
    required this.config,
    required this.panelId,
    this.finishInputValues,
  });

  @override
  State<EditInfoDialog> createState() => _EditInfoDialogState();
}

class _EditInfoDialogState extends State<EditInfoDialog> {
  List<InputTextItem>? inputItems;

  List<Widget> _DialogWidgetItems(BuildContext context) {
    List<Widget> items = <Widget>[];
    if (widget.config.title.length > 0) {
      Widget titleItem = Container(
        child: Text(
          widget.config.title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        margin: EdgeInsets.only(bottom: 10),
      );
      items.add(titleItem);
    }
    inputItems = <InputTextItem>[];
    for (var i = 0; i < widget.config.keyboardConfigs.length; i++) {
      inputItems!.add(InputTextItem(
        config: widget.config.keyboardConfigs[i],
      ));
    }
    items = items + inputItems!;
    Widget btn = CommonButton(
        text: "确定",
        onPressed: () {
          _commonButtonDidTap(context);
        });
    items.add(btn);
    return items;
  }

  void _commonButtonDidTap(BuildContext context) {
    bool shouldCloseDialog = true;
    List values = [];
    for (var i = 0; i < inputItems!.length; i++) {
      String value = inputItems![i].inputValue();
      if (value.length <= 0) {
        shouldCloseDialog = false;
        String originTitle = widget.config.keyboardConfigs[i].keyboardTitle;

        String kTitle =
            originTitle.contains("*") ? originTitle : "*" + originTitle;
        setState(() {
          widget.config.keyboardConfigs[i].keyboardTitle = kTitle;
        });
      }

      values.add(value);
    }
    if (widget.finishInputValues != null && shouldCloseDialog) {
      widget.finishInputValues!(values, widget.panelId);
      Navigator.of(context).pop();
    }
  }

  double _DialogWidgetItemsHeight(PanelID panelID) {
    switch (panelID) {
      case PanelID.averageExtraWorkTime:
      case PanelID.averageFormalWorkerYear:
      case PanelID.averageWorkerAge:
        return 186.0;
      case PanelID.averageExtraWorkerCount:
        return 216.0;
      case PanelID.halfwayAcceptance:
      case PanelID.halfway2Acceptance:
        return 384.0;
      case PanelID.manAcceptanceList:
      case PanelID.womanAcceptanceList:
        return 302.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white.withAlpha(0),
      content: Container(
        padding: EdgeInsets.all(25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        height: _DialogWidgetItemsHeight(widget.panelId),
        width: 309,
        child: Column(
          children: _DialogWidgetItems(context),
        ),
      ),
    );
  }
}
