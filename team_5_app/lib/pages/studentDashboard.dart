import 'package:flutter/material.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Student HomePage'),
        ),
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                  accountName: CircleAvatar(child: Text('JG')),
                  accountEmail: Column(
                    children: [
                      Text('email@example.com'),
                      LinearProgressIndicator(
                          value: 75.0, backgroundColor: Colors.amber),
                    ],
                  ))
            ],
          ),
        ),
        body: const Center(
          child: Text('Text in the center of the screen'),
        ));
  }
}
