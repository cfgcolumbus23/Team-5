import 'package:flutter/material.dart';

class AssessmentProgress extends StatelessWidget {
  const AssessmentProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const FractionallySizedBox(
        widthFactor: .8,
        child: Column(children: [
          Row(children: [
            Flexible(
                child: Text(
              "Progress towards lesson:   ",
              style: TextStyle(
                color: Colors.deepPurple,
                fontSize: 20,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
              ),
            )),
            Flexible(
                child: LinearProgressIndicator(value: 80, color: Colors.green)),
          ]),
        ]));
  }
}
