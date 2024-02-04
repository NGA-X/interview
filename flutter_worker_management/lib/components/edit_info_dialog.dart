import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/common_button.dart';
import 'package:flutter_worker_management/components/input_item.dart';
import 'package:flutter_worker_management/utils/basics.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

class EditInfoDialog extends StatelessWidget {
  final DialogConfig config;
  final PanelID panelId;
  Function(List values, PanelID panelID)? finishInputValues;

  List<InputTextItem>? inputItems;
  EditInfoDialog({
    super.key,
    required this.config,
    required this.panelId,
    this.finishInputValues,
  });

  List<Widget> _DialogWidgetItems(BuildContext context) {
    List<Widget> items = <Widget>[];
    if (config.title.length > 0) {
      items.add(Text(
        config.title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ));
    }
    inputItems = <InputTextItem>[];
    for (var i = 0; i < config.keyboardConfigs.length; i++) {
      inputItems!.add(InputTextItem(
        config: config.keyboardConfigs[i],
      ));
    }
    items = items + inputItems!;
    Widget btn = CommonButton(
        text: "确定",
        onPressed: () {
          List values = [];
          for (var i = 0; i < inputItems!.length; i++) {
            values.add(inputItems![i].inputValue());
          }
          if (finishInputValues != null) {
            finishInputValues!(values, panelId);
          }
          Navigator.of(context).pop();
        });
    items.add(btn);
    return items;
  }

  double _DialogWidgetItemsHeight(PanelID panelID) {
    double h = 0.0;
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
        height: _DialogWidgetItemsHeight(panelId),
        child: Column(
          children: _DialogWidgetItems(context),
        ),
      ),
    );
  }
}
