import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:team_5_app/pages/assessment/assessment.dart';

class Incentives extends StatelessWidget {
  const Incentives({super.key});

  @override
  FractionallySizedBox build(BuildContext context) {
    // build the list of incentives
    List<Row> incentives = [];
    // Table header
    incentives.add(const Row(
      children: [
        SizedBox(child: Material(child: Center(child: Text('Reward')))),
        Expanded(child: Material(child: Center(child: Text('Requirement')))),
        SizedBox(child: Material(child: Center(child: Text('Reward Claimed?'))))
      ],
    ));
    // Table row
    incentives.add(Row(
      children: [
        SizedBox(child: Material(child: Container(child: const Text(r'$25')))),
        Expanded(
            child: SizedBox(
                width: double.infinity,
                child: Material(
                    child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('IT Fundamentals'))))),
        const SizedBox(
            child: Material(
                child: Icon(
          Icons.highlight_off,
          color: Colors.red,
        )))
      ],
    ));
    incentives.add(Row(
      children: [
        const SizedBox(child: Material(child: Text(r'$50'))),
        Expanded(
            child: Material(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('A+ Certifications')))),
        const SizedBox(
            child: Material(
                child: Icon(
          Icons.done,
          color: Colors.green,
        )))
      ],
    ));
    // Table row
    incentives.add(Row(
      children: [
        const SizedBox(child: Material(child: Text(r'$15'))),
        Expanded(
            child: Material(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Digital Literacy')))),
        const SizedBox(
            child: Material(
                child: Icon(
          Icons.highlight_off,
          color: Colors.red,
        )))
      ],
    ));
    incentives.add(Row(
      children: [
        const SizedBox(child: Material(child: Text(r'$25'))),
        Expanded(
            child: Material(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('IT Certifications')))),
        const SizedBox(
            child: Material(
                child: Icon(
          Icons.done,
          color: Colors.green,
        )))
      ],
    ));
    // Table row
    incentives.add(Row(
      children: [
        const SizedBox(child: Material(child: Text(r'$50'))),
        Expanded(
            child: Material(
                child: ElevatedButton(
                    onPressed: () {}, child: const Text('Complete ESB')))),
        const SizedBox(
            child: Material(
                child: Icon(
          Icons.done,
          color: Colors.green,
        )))
      ],
    ));

    return FractionallySizedBox(
        widthFactor: .8,
        heightFactor: 1,
        child: Column(children: [
          const Row(children: [
            Flexible(child: Text("Next Incentive Status: ")),
            SizedBox(
              height: 50,
            ),
            Flexible(
                child:
                    LinearProgressIndicator(value: 100, color: Colors.green)),
          ]),
          const Center(child: Text("Incentives: ")),
          Column(children: incentives)
        ]));
  }
}
