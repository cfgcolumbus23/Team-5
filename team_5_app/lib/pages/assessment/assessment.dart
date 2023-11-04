import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:team_5_app/pages/assessment/assessment_progress.dart';

class AssessmentPage extends StatefulWidget {
  const AssessmentPage({super.key});
  @override
  State<AssessmentPage> createState() => _AssessmentPageState();
}

class _AssessmentPageState extends State<AssessmentPage> {
  final dio = Dio();
  final hardCodedId = 2;

  Future<String> getAssignment() async {
    final response =
        await dio.get('http://localhost:4000/assignments/$hardCodedId');

    return response.data['assignmentName'] as String;
  }

  @override
  Scaffold build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: Text(
            assignmentName,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 27,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: const Center(
            child: Column(children: [
          AssessmentProgress(),
        ])));

    // assessment progress

    // assessment grade
  }
}
