import 'package:flutter/material.dart';
import 'package:team_5_app/pages/assessment.dart';

class AssessmentProgress extends StatelessWidget {
  const AssessmentProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
        widthFactor: .8,
        child: Column(children: [
          Row(children: [
            Flexible(child: Text("Progress towards lesson:   ",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            )),
            Flexible(
                child:
                LinearProgressIndicator(value: 100, color: Colors.green)),
          ]),
        ]));
  }
}
