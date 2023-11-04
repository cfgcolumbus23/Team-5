import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});
  @override
  State<AdminPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<AdminPage> {

  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Admin Dashboard'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: 'Graphs',
              ),
              Tab(
                text: 'Students',
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: <Widget>[
            Center(
              child: Text("Graphs here"),
            ),
            Center(
              child: Text("Data here"),
            ),
          ],
        ),
      ),
    );
  }
}
