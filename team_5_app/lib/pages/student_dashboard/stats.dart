import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../assessment/assessment.dart';

class Stats extends StatefulWidget {
  int id;
  Stats({super.key, required this.id});

  @override
  // ignore: no_logic_in_create_state
  State<Stats> createState() => _StatsState(id: id);
}

class _StatsState extends State<Stats> {
  final dio = Dio();
  int id = 0;
  _StatsState({required this.id});
  //List<Column> assessmentInfo = [];

  List<Column> makeAssessment(List<dynamic>? columns) {
    if (columns != null) {
      return columns as List<Column>;
    } else {
      return <Column>[];
    }
  }

  Future<List<Column>> getAssessments() async {
    List<Column> assessmentInfo = [];
    final response = await dio.get('http://localhost:4000/assignments');

    // parse the responses
    List<dynamic> studentJson = response.data as List<dynamic>;
    try {
      for (int j = 0; j < studentJson.length; j++) {
        dynamic item = studentJson[j];

        assessmentInfo.add(Column(children: [
          buildCard(item['assignmentName'], item['assessmentPercent'][j],
              item['assignmentId']),
          const SizedBox(height: 12),
        ]));
      }
    } catch (e) {
      //print(e);
    }
    return assessmentInfo;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAssessments(),
        builder: (context, snapshot) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Wrap(children: makeAssessment(snapshot.data)),
          );
        });
  }

  buildCard(String name, int score, int id) {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child: ElevatedButton(
            onPressed: () {
              Get.to(AssessmentPage(id: id));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF9F7BFF),
            ),
            child: Center(
                child: Text(
              '$name: $score',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
              ),
            ))));
  }
}
