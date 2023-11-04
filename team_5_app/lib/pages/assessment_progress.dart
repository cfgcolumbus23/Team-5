import 'package:flutter/material.dart';

class AssessmentProgress extends StatelessWidget {
  const AssessmentProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          useMaterial3: true, colorSchemeSeed: const Color(0xff6750a4)),
      home: const ProgressIndicatorExample(),
    );
  }
}

class ProgressIndicatorExample extends StatefulWidget {
  const ProgressIndicatorExample({super.key});

  @override
  State<StatefulWidget> createState() {
    _ProgressIndicatorExampleState();
  }
}

class _ProgressIndicatorExampleState extends State<ProgressIndicatorExample> {

  late AnimationController controller;
  bool determinate = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
