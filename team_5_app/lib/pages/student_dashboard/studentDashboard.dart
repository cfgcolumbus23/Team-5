import 'package:coverflow/coverflow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_5_app/pages/student_dashboard/incentives.dart';
import 'package:team_5_app/pages/student_dashboard/stats.dart';
import 'package:team_5_app/pages/student_dashboard/to_do.dart';

class StudentDashboard extends StatelessWidget {
  const StudentDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    var todos = [
      'Complete certificate',
      'Finish lesson today',
      'Get gift card'
    ];
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student HomePage'),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              const UserAccountsDrawerHeader(
                  accountName: CircleAvatar(child: Text('JG')),
                  accountEmail: Column(
                    children: [
                      Text('UserName'),
                      LinearProgressIndicator(
                          value: 75.0, backgroundColor: Colors.amber),
                    ],
                  )),
              const ListTile(
                title: Text(
                  'To-Do',
                  style: TextStyle(
                    color: Color(0xFF755DC1),
                    fontSize: 27,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              ...[
                for (var todo in todos)
                  ToDo(
                    title: todo,
                  )
              ]
            ],
          ),
        ), //
        body: const Center(
          child: Column(children: [
            Stats(),
            Incentives(),
          ]),
        ));
  }
}


