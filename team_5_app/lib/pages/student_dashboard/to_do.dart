import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
