import 'package:flutter/material.dart';

class AssessmentsList extends StatelessWidget {
  // TODO: implement build
  @override
  Widget build(BuildContext context) {
    // assessment title
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text(
          'Assessments List',
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: const FractionallySizedBox(
        widthFactor: 0.8,
        child: Column(
          children: [
            Text("CompTIA"),
            Text("IT Fundamentals"),
            Text("A+ Certifications")
          ],
        ),
      ),
    );
  }
}
