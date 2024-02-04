import 'package:flutter/material.dart';
import 'package:flutter_worker_management/pages/edit_page.dart';
import 'package:flutter_worker_management/utils/ny_color.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Worker Management',
        home: EditPage(
          halfwayAcceptance: {
            "one": "10",
            "two": "20",
            "three": "30",
          },
          manAcceptanceList: [
            {"careerName": "技術職", "acceptionRate": "34%"},
            {"careerName": "専門職", "acceptionRate": "50%"},
            {"careerName": "正社員", "acceptionRate": "100%"},
          ],
        ),
        theme: ThemeData(
          primaryColor: NYColor.fontColor(),
        ));
  }
}
