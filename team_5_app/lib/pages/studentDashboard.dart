import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              title: Text('To-Do',
                style: TextStyle(
                  color: Color(0xFF755DC1),
                  fontSize: 27,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
              ),
              ),
            ),
            ToDo(),
          ],
        ),
      ), //
    );
        body: const Center(
          child: Column(
            children: [
              Stats(),
              Incentives(),
            ]
          ),
        );
  }
}
class ToDo extends StatelessWidget {
   ToDo({super.key});

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
          shape: RoundedRectangleBorder (
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          tileColor: Colors.white60,
          leading: Obx(()=>Icon(
            isChecked.value?
            Icons.check_box: Icons.check_box_outline_blank,
            color: Colors.deepPurpleAccent,
          )),
          title: const Text('Complete certificate'),
        )
        );
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
