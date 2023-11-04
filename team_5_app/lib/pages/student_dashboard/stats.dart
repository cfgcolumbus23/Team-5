import 'package:flutter/material.dart';
import 'package:coverflow/coverflow.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:team_5_app/pages/assessment/assessment_progress.dart';

class Stats extends StatelessWidget {
  const Stats();

  @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   List<int> scores = [80,88,88,86];
  //   List<String> tests = ["Int Basics Assessment", "Email Assessment", "Win Assessment", "Mac Assessment"];
  //   return Expanded(
    
  //       child: CoverFlow(images: 
  //         [
  //           for(var i=0; i< scores.length; i++) SizedBox(
  //               width: 200,
  //               height: 200,
  //               child: ElevatedButton(
  //                 onPressed: () {
  //                     //Get.to(Assessment1());
  //                 },
  //                 style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFF9F7BFF),
  //                 ),

  //                 child: Container(
  //                   color: Colors.white,
  //                   child: Text('${tests.elementAt(i)}: ${scores.elementAt(i)} %',
  //                   textAlign: TextAlign.center,
  //                   style: const TextStyle(
  //                       fontFamily: 'Arial',
  //                   ),)
                    
  //                 ),
  //               )
  //             ),
  //         ] 
  //       ),
  //   );
    

  //}
  FractionallySizedBox build(BuildContext context) {
    // build the list of incentives
    List<TableRow> assignments = [];
    List<int> scores = [80,88,88,86];
    List<String> tests = ["Int Basics Assessment", "Email Assessment", "Win Assessment", "Mac Assessment"];
    // Table header
    for (var i = 0; i < scores.length; i++) {
    assignments.add( TableRow(
      children: [
        const TableCell(child: Center(child: Text(''))),
        const TableCell(child: Center(child: Text(''))),
        TableCell(child: Center(child: ElevatedButton(
          onPressed: () {
              Get.to(const AssessmentProgress());
           },
          child: Text('${tests.elementAt(i)}: '))),
        ),
        TableCell(child: Center(
          child: Text(
            '${scores.elementAt(i)} %')
            )
          ),
          const TableCell(child: Center(child: Text(''))),
          const TableCell(child: Center(child: Text(''))),
      ],
      ));
    }
    
    return FractionallySizedBox(
        widthFactor: 2,
        child: ListView(children: [
          const Row(children: [
            Flexible(child: Text("Status For Next Incentive: ")),
            Flexible(
                child:
                    LinearProgressIndicator(value: 100, color: Colors.green)),
          ]),
          const Text("Assignments: "),
          Table(children: assignments)
        ])
        
        );
  }
}