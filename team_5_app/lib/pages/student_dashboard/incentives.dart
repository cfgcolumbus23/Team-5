import 'package:flutter/material.dart';

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
    incentives.add(const TableRow(
      children: [
        TableCell(child: Text(r'$25 Gift Card')),
        TableCell(child: Text('Complete Digital Literacy')),
        TableCell(
            child: Icon(
          Icons.highlight_off,
          color: Colors.red,
        ))
      ],
    ));
    incentives.add(const TableRow(
      children: [
        TableCell(child: Text(r'$50 Gift Card')),
        TableCell(child: Text('Complete CompTIA')),
        TableCell(
            child: Icon(
          Icons.done,
          color: Colors.green,
        ))
      ],
    ));

    return FractionallySizedBox(
        widthFactor: .8,
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
