import 'package:coverflow/coverflow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_5_app/pages/student_dashboard/incentives.dart';
import 'package:team_5_app/pages/student_dashboard/stats.dart';

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

class ToDo extends StatelessWidget {
  String title;

  ToDo({super.key, required this.title});

  late Icon checkbox;
  var isChecked = false.obs;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        child: ListTile(
          onTap: () {
            isChecked.value = !isChecked.value;
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white60,
          leading: Obx(() => Icon(
                isChecked.value
                    ? Icons.check_box
                    : Icons.check_box_outline_blank,
                color: Colors.deepPurpleAccent,
              )),
          title: Text(title),
        ));
  }
}


