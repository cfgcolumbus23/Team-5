import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_5_app/pages/assessment/assessment.dart';

class Incentives extends StatelessWidget {
  const Incentives({super.key});

  @override
  FractionallySizedBox build(BuildContext context) {
    // build the list of incentives
    List<TableRow> incentives = [];
    // Table header
    incentives.add(const TableRow(
      children: [
        TableCell(child: Center(child: Text('Reward'))),
        TableCell(child: Center(child: Text('Requirement'))),
        TableCell(child: Center(child: Text('Reward Claimed?')))
      ],
    ));
    // Table row
    incentives.add(TableRow(
      children: [
        TableCell(child: Text(r'$25 Gift Card')),
        TableCell(child: ElevatedButton(
          onPressed: () {},
          child: Text('IT Fundamentals'))),
        TableCell(
            child: Icon(
          Icons.highlight_off,
          color: Colors.red,
        ))
      ],
    ));
    incentives.add(TableRow(
      children: [
        TableCell(child: Text(r'$50 Gift Card')),
        TableCell(child: ElevatedButton(
          onPressed: () {},
          child: Text('A+ Certifications'))),
        TableCell(
            child: Icon(
          Icons.done,
          color: Colors.green,
        ))
      ],
    ));
    // Table row
    incentives.add(TableRow(
      children: [
        TableCell(child: Text(r'$15 Gift Card')),
        TableCell(child: ElevatedButton(
          onPressed: () {},
          child: Text('Digital Literacy'))),
        TableCell(
            child: Icon(
          Icons.highlight_off,
          color: Colors.red,
        ))
      ],
    ));
    incentives.add(TableRow(
      children: [
        TableCell(child: Text(r'$25 Gift Card')),
        TableCell(child: ElevatedButton(
          onPressed: () {},
          child: Text('IT Certifications'))),
        TableCell(
            child: Icon(
          Icons.done,
          color: Colors.green,
        ))
      ],
    ));
    // Table row
    incentives.add(TableRow(
      children: [
        TableCell(child: Text(r'$50 Gift Card')),
        TableCell(child: ElevatedButton(
          onPressed: () {},
          child: Text('Complete ESB'))),
        TableCell(
            child: Icon(
          Icons.done,
          color: Colors.green,
        ))
      ],
    ));
    

    return FractionallySizedBox(
        widthFactor: .8,
        heightFactor: 1,
        child: Column(children: [
          const Row(children: [
            Flexible(child: Text("Status For Next Incentive: ")),
            Flexible(
                child:
                    LinearProgressIndicator(value: 100, color: Colors.green)),
          ]),
          const Text("Incentives: "),
          Table(children: incentives)
        ]));
  }
}
