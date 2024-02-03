import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_worker_management/components/common_button.dart';
import 'package:flutter_worker_management/components/edit_info_button.dart';
import 'package:flutter_worker_management/components/edit_info_dialog.dart';
import 'package:flutter_worker_management/components/halfway_acceptance_panel.dart';
import 'package:flutter_worker_management/components/parent_baby_acceptance_panel.dart';
import 'package:flutter_worker_management/components/worker_average_panel.dart';

class EditPage extends StatelessWidget {
  const EditPage({super.key});

  void editHalfwayAcceptanceRate(BuildContext context) {
    print("Tap");
    showDialog(
        context: context,
        builder: ((context) {
          return EditInfoDialog();
        }));
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
                  panelTitle: "中途採用比率",
                  panelDiscription: "前年度/2年度前/3年度前",
                  acceptionRate: "10%/20%/30%",
                  editButtonDidTap: () {
                    editHalfwayAcceptanceRate(context);
                  },
                ),
                HalfwalAcceptancePanel(
                  panelTitle: "中途採用比率2",
                  panelDiscription: "前年度/2年度前/3年度前",
                  acceptionRate: "10%/20%/30%dasfdsfsdfasfasfsd",
                  editButtonDidTap: () {
                    editHalfwayAcceptanceRate(context);
                  },
                ),
                WorkerAveragePanel(
                    panelTitle: "正社員の平均継続勤務年数", panelDetail: "18.5年"),
                WorkerAveragePanel(panelTitle: "従業員の平均年齢", panelDetail: "50歳"),
                WorkerAveragePanel(
                    panelTitle: "月平均所定外労働時間", panelDetail: "18時間"),
                WorkerAveragePanel(
                    panelTitle: "平均の法定時間外労働60時間以上の労働者の数", panelDetail: "15"),
                ParentBabyAcceptancePanel(
                    panelTitle: "育児休業取得率（男性）", acceptionRate: ""),
                ParentBabyAcceptancePanel(
                    panelTitle: "育児休業取得率（女性）", acceptionRate: ""),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
