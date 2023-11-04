import 'package:flutter/material.dart';
import 'package:team_5_app/pages/assessment_progress.dart';
import 'package:team_5_app/pages/login.dart';

class AssessmentPage extends StatelessWidget {
  const AssessmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // assessment title
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'AssessmentName Title Page',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const Center(
        child: Column (
          children: [
            AssessmentProgress(),
          ]
        )
      )
    );

    // assessment progress

    // assessment grade
  }
}
