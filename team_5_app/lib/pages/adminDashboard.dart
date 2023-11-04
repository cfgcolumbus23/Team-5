import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:dio/dio.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);
  @override
  State<AdminPage> createState() => _AdminPageState();
}

class StudentInfoModel {
  StudentInfoModel({required this.name, required this.id});
  String name;
  int id;
}

class _AdminPageState extends State<AdminPage> {
  final dio = Dio();

  List<StudentInfoModel> studentInfo = [];

  Future<List<StudentInfoModel>> getStudentsInfo() async {
    final response = await dio.get('http://localhost:4000/users');
    List<StudentInfoModel> studentInfoModels = [];

    //Do some parsing here.
    List<dynamic> studentJson = response.data as List<dynamic>;
    try {
      for (int j = 0; j < studentJson.length; j++) {
        dynamic item = studentJson[j];
        studentInfoModels
            .add(StudentInfoModel(name: item['name'], id: item['id']));
      }
    } catch (e) {
      print(e);
    }
    return studentInfoModels;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: getStudentsInfo(),
      builder: (context, snapshot) {
        return DefaultTabController(
          initialIndex: 1,
          length: 2, // Corrected the length to 2 as you have only 2 tabs.
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
            body: TabBarView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: LineChart(
                    LineChartData(
                      gridData: const FlGridData(show: false),
                      titlesData: const FlTitlesData(show: false),
                      borderData: FlBorderData(
                        show: true,
                        border: Border.all(
                          color: const Color(0xff37434d),
                          width: 1,
                        ),
                      ),
                      minX: 0,
                      maxX: 7,
                      minY: 0,
                      maxY: 6,
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            const FlSpot(0, 3),
                            const FlSpot(1, 1),
                            const FlSpot(2, 4),
                            const FlSpot(3, 2.5),
                            const FlSpot(4, 1.5),
                            const FlSpot(5, 3),
                            const FlSpot(6, 3.5),
                          ],
                          isCurved: true,
                          color: Colors.blue,
                          dotData: const FlDotData(show: false),
                          belowBarData: BarAreaData(show: false),
                        ),
                      ],
                    ),
                  ),
                ),
                const Center(
                  child: Text("Data here"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
