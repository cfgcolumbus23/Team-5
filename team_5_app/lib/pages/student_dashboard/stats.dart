import 'package:flutter/material.dart';
import 'package:coverflow/coverflow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:team_5_app/pages/assessment/assessment_progress.dart';

import '../assessment/assessment.dart';

class Stats extends StatelessWidget {
  const Stats();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            buildCard('Int Basic Assessment', 80),
            const SizedBox(height: 12),
            buildCard('Email Assessment', 89),
            const SizedBox(height: 12),
            buildCard('Win Assessment', 90),
            const SizedBox(height: 12),
            buildCard('Mac Assessment', 75),
            const SizedBox(height: 12),
            buildCard('Test', 90),
            const SizedBox(height: 12),
          ],
        )
    );
  }

  buildCard(String name, int score) {
    return SizedBox(
        width: double.infinity,
        height: 100,
        child:ElevatedButton(
        onPressed: () {
          Get.to(const AssessmentPage());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF9F7BFF),
        ),
            child: Center(child: Text('$name: $score',
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontFamily: 'Arial',
              ),
            )
            )
        )
      );
  }
}