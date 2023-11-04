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
    return DefaultTabController(
        initialIndex: 1,
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Student HomePage'),
            bottom: const TabBar(tabs: <Widget>[
              Tab(
                icon: Icon(Icons.list),
              ),
              Tab(
                icon: Icon(Icons.assessment),
              ),
              Tab(
                icon: Icon(Icons.money),
              )
            ]),
          ),
          body: TabBarView(children: <Widget>[
            Padding(
                padding: const EdgeInsets.all(16.0),
                child: Wrap(
                  children: <Widget>[
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
                    ],
                  ],
                )),
            const Stats(),
            const Incentives()
          ]),
        ));
  }
}
