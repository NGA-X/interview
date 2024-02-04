import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/common_button.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/components/edit_info_dialog.dart';
import 'package:flutter_worker_management/components/halfway_acceptance_panel.dart';
import 'package:flutter_worker_management/components/parent_baby_acceptance_panel.dart';
import 'package:flutter_worker_management/components/worker_average_panel.dart';
import 'package:flutter_worker_management/utils/basics.dart';

class EditPage extends StatefulWidget {
  // {"one":"10","two":"20","three":"30",}
  Map<String, String>? halfwayAcceptance;
  Map<String, String>? halfway2Acceptance;
  String? averageFormalWorkerYear;
  String? averageWorkerAge;
  String? averageExtraWorkTime;
  String? averageExtraWorkerCount;
  List<Map<String, String>>? manAcceptanceList;
  List<Map<String, String>>? womanAcceptanceList;

  EditPage({
    super.key,
    this.halfwayAcceptance,
    this.halfway2Acceptance,
    this.averageFormalWorkerYear,
    this.averageWorkerAge,
    this.averageExtraWorkTime,
    this.averageExtraWorkerCount,
    this.manAcceptanceList,
    this.womanAcceptanceList,
  });

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  void _updateHalfwayRate(List values, PanelID panelID) {
    if (values.length < 3) {
      print("Invalid Input!");
      return;
    }
    Map<String, String> rate = {
      "one": values[0],
      "two": values[1],
      "three": values[2],
    };
    if (panelID == PanelID.halfwayAcceptance) {
      setState(() {
        widget.halfwayAcceptance = rate;
      });
    } else {
      setState(() {
        widget.halfway2Acceptance = rate;
      });
    }
  }

  void _editHalfwayAcceptanceRate(BuildContext context, PanelID panelId) {
    showDialog(
        context: context,
        builder: ((context) {
          List<KeyboardConfig> keyboardConfigs = [
            KeyboardConfig("前年度(単位：%)", "前年度中途採用比率", TextInputType.number),
            KeyboardConfig("2年度前(単位：%)", "2年度前中途採用比率", TextInputType.number),
            KeyboardConfig("3年度前(単位：%)", "3年度前中途採用比率", TextInputType.number),
          ];
          String title =
              panelId == PanelID.halfwayAcceptance ? "中途採用比率" : "中途採用比率2";
          EditInfoDialog dialog = EditInfoDialog(
              config: DialogConfig(title, keyboardConfigs),
              panelId: panelId,
              finishInputValues: _updateHalfwayRate);
          return dialog;
        }));
  }

  String _halfwayAcceptanceContent(Map<String, String>? acceptance) {
    String acceptanceStr = "";
    if (acceptance == null) {
      return acceptanceStr;
    }
    if (acceptance['one'] != null) {
      String str = acceptance['one']!;
      acceptanceStr = acceptanceStr + "$str%/";
    }
    if (acceptance['two'] != null) {
      String str = acceptance['two']!;
      acceptanceStr = acceptanceStr + "$str%/";
    }

    if (acceptance['three'] != null) {
      String str = acceptance['three']!;
      acceptanceStr = acceptanceStr + "$str%";
    }

    return acceptanceStr; //"10%/20%/30%";
  }

  String _averagePanelContent(String? inputValue, PanelID panelID) {
    String averageContent = "";
    if (inputValue == null) {
      return averageContent;
    }

    switch (panelID) {
      case PanelID.averageExtraWorkTime:
        averageContent = "$inputValue 時間";
        break;
      case PanelID.averageExtraWorkerCount:
        averageContent = "$inputValue 人";
        break;
      case PanelID.averageFormalWorkerYear:
        averageContent = "$inputValue 年";
        break;
      case PanelID.averageWorkerAge:
        averageContent = "$inputValue 歳";
        break;
      default:
        return averageContent;
    }
    return averageContent;
  }

  void _editAverageContent(BuildContext context, PanelID panelId) {
    showDialog(
        context: context,
        builder: ((context) {
          List<KeyboardConfig> keyboardConfigs = [];
          KeyboardConfig keyboardConfig;
          switch (panelId) {
            case PanelID.averageExtraWorkTime:
              keyboardConfig =
                  KeyboardConfig("月平均所定外労働時間（単位：時間）", "", TextInputType.number);
              break;
            case PanelID.averageExtraWorkerCount:
              keyboardConfig = KeyboardConfig(
                  "平均の法定時間外労働60時間以上の労働者の数（単位：人）", "", TextInputType.number);
              break;
            case PanelID.averageFormalWorkerYear:
              keyboardConfig = KeyboardConfig(
                  "正社員の平均継続勤務年数（単位：年）", "", TextInputType.number);
              break;
            case PanelID.averageWorkerAge:
              keyboardConfig =
                  KeyboardConfig("従業員の平均年齢（単位：歳）", "", TextInputType.number);
              break;
            default:
              keyboardConfig =
                  KeyboardConfig("前年度(単位：%)", "", TextInputType.number);
          }
          keyboardConfigs.add(keyboardConfig);
          String title = "";
          EditInfoDialog dialog = EditInfoDialog(
              config: DialogConfig(title, keyboardConfigs),
              panelId: panelId,
              finishInputValues: ((values, panelID) {
                _updateAverageContent(values, panelID);
              }));
          return dialog;
        }));
  }

  void _updateAverageContent(List values, PanelID panelID) {
    print("aaaaaaa");
    if (values.length < 1) {
      print("Invalid Input!");
      return;
    }
    String averageContent = values.first;

    switch (panelID) {
      case PanelID.averageExtraWorkTime:
        setState(() {
          widget.averageExtraWorkTime = averageContent;
        });
        break;
      case PanelID.averageExtraWorkerCount:
        setState(() {
          widget.averageExtraWorkerCount = averageContent;
        });
        break;
      case PanelID.averageFormalWorkerYear:
        setState(() {
          widget.averageFormalWorkerYear = averageContent;
        });
        break;
      case PanelID.averageWorkerAge:
        setState(() {
          widget.averageWorkerAge = averageContent;
        });
        break;
      default:
        return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
            left: 16,
            top: MediaQuery.of(context).padding.top,
            right: 16,
            bottom: 19),
        child: CustomScrollView(slivers: [
          SliverFillRemaining(
            child: Column(
              children: [
                HalfwalAcceptancePanel(
                  panelId: PanelID.halfwayAcceptance,
                  panelTitle: "中途採用比率",
                  panelDiscription: "前年度/2年度前/3年度前",
                  acceptionRate:
                      _halfwayAcceptanceContent(widget.halfwayAcceptance),
                  editButtonDidTap: (panelId) {
                    _editHalfwayAcceptanceRate(context, panelId);
                  },
                ),
                HalfwalAcceptancePanel(
                  panelId: PanelID.halfway2Acceptance,
                  panelTitle: "中途採用比率2",
                  panelDiscription: "前年度/2年度前/3年度前",
                  acceptionRate:
                      _halfwayAcceptanceContent(widget.halfway2Acceptance),
                  editButtonDidTap: (panelId) {
                    _editHalfwayAcceptanceRate(context, panelId);
                  },
                ),
                WorkerAveragePanel(
                    panelId: PanelID.averageFormalWorkerYear,
                    panelTitle: "正社員の平均継続勤務年数",
                    panelDetail: _averagePanelContent(
                        widget.averageFormalWorkerYear,
                        PanelID.averageFormalWorkerYear),
                    editButtonDidTap: ((panelId) {
                      _editAverageContent(
                          context, PanelID.averageFormalWorkerYear);
                    })),
                WorkerAveragePanel(
                    panelId: PanelID.averageWorkerAge,
                    panelTitle: "従業員の平均年齢",
                    panelDetail: _averagePanelContent(
                        widget.averageWorkerAge, PanelID.averageWorkerAge),
                    editButtonDidTap: ((panelId) {
                      _editAverageContent(context, PanelID.averageWorkerAge);
                    })),
                WorkerAveragePanel(
                    panelId: PanelID.averageExtraWorkTime,
                    panelTitle: "月平均所定外労働時間",
                    panelDetail: _averagePanelContent(
                        widget.averageExtraWorkTime,
                        PanelID.averageExtraWorkTime),
                    editButtonDidTap: ((panelId) {
                      _editAverageContent(
                          context, PanelID.averageExtraWorkTime);
                    })),
                WorkerAveragePanel(
                    panelId: PanelID.averageExtraWorkerCount,
                    panelTitle: "平均の法定時間外労働60時間以上の労働者の数",
                    panelDetail: _averagePanelContent(
                        widget.averageExtraWorkerCount,
                        PanelID.averageExtraWorkerCount),
                    editButtonDidTap: ((panelId) {
                      _editAverageContent(
                          context, PanelID.averageExtraWorkerCount);
                    })),
                ParentBabyAcceptancePanel(
                    panelId: PanelID.manAcceptanceList,
                    panelTitle: "育児休業取得率（男性）",
                    parentAcceptanceList: widget.manAcceptanceList),
                ParentBabyAcceptancePanel(
                    panelId: PanelID.womanAcceptanceList,
                    panelTitle: "育児休業取得率（女性）",
                    parentAcceptanceList: widget.womanAcceptanceList),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
