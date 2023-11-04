import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:team_5_app/pages/assessment/assessment_progress.dart';

class AssessmentPage extends StatefulWidget {
  int id;
  AssessmentPage({super.key, required this.id});
  @override
  // ignore: no_logic_in_create_state
  State<AssessmentPage> createState() => _AssessmentPageState(id: id);
}

class _AssessmentPageState extends State<AssessmentPage> {
  final dio = Dio();
  int id;
  _AssessmentPageState({required this.id});
  String assessmentName = "default";

  Future<Response> getAssignment() async {
    final response = await dio.get('http://localhost:4000/assignments/$id');

    assessmentName = response.data['assignmentName'];
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getAssignment(),
        builder: (context, snapshot) {
          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurpleAccent,
                title: Text(
                  assessmentName,
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
        });
  }
}
