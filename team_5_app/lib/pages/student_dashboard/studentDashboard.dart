import 'package:coverflow/coverflow.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:team_5_app/pages/student_dashboard/incentives.dart';
import 'package:team_5_app/pages/student_dashboard/stats.dart';
import 'package:team_5_app/pages/student_dashboard/to_do.dart';

// ignore: must_be_immutable
class StudentDashboard extends StatefulWidget {
  int studentID;
  StudentDashboard({super.key, required this.studentID});
  @override
  State<StudentDashboard> createState() =>
      // ignore: no_logic_in_create_state
      _StudentDashboardState(studentID: studentID);
}

class _StudentDashboardState extends State<StudentDashboard> {
  final dio = Dio();
  int studentID;
  _StudentDashboardState({required this.studentID});
  String firstName = "default";
  String lastName = "default";

  Future<bool> getStudent() async {
    final response = await dio.get('http://localhost:4000/user/$studentID');

    firstName = response.data['firstName'];
    lastName = response.data['lastName'];
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: getStudent(),
        builder: (context, snapshot) {
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
                  title: Text('$firstName $lastName\'s Dashboard'),
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
                  Stats(id: studentID),
                  const Incentives()
                ]),
              ));
        });
  }
}
