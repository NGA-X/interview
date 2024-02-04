import 'dart:ffi';

import 'package:flutter/material.dart';

enum PanelID {
  halfwayAcceptance,
  halfway2Acceptance,

  /// 正社員の平均継続勤務年数 18.5年
  averageFormalWorkerYear,

  /// 従業員の平均年齢 50歳
  averageWorkerAge,

  /// 月平均所定外労働時間 18時間
  averageExtraWorkTime,

  /// 平均の法定時間外労働60時間以上の労働者の数 （単位：人）
  averageExtraWorkerCount,
  manAcceptanceList,
  womanAcceptanceList
}

class KeyboardConfig {
  final String keyboardTitle;
  final String keyboardHint;
  final TextInputType type;
  KeyboardConfig(this.keyboardTitle, this.keyboardHint, this.type);
}

class DialogConfig {
  final String title;
  final List<KeyboardConfig> keyboardConfigs;
  DialogConfig(this.title, this.keyboardConfigs);
}
