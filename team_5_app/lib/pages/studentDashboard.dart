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
          child: Column(
            children: [
              Stats(),
              Incentives(),
            ]
          ),
        ));
  }
}



class Stats extends StatelessWidget{
  const Stats();
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<int> scores = [80,88,88,86,84];
    return ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[   
            Container(
              child: Text('Score: ' + scores.elementAt(0).toString()),
            ),
            Container(
              child: Text('Score: ' + scores.elementAt(1).toString()),
            ),
            Container(
              child: Text('Score: ' + scores.elementAt(2).toString()),
            ),
            Container(
              child: Text('Score: ' + scores.elementAt(3).toString()),
            ),
            Container(
              child: Text('Score: ' + scores.elementAt(4).toString()),
            ),
        ]
    );
  }
}

class Incentives extends StatelessWidget {
  const Incentives();
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
