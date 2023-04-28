import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:math';
import 'package:time_planner/time_planner.dart';

class HomePage extends StatefulWidget {
  //const HomePage({Key? key, required this.title}) : super(key: key);
  const HomePage({super.key, required this.title});

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TimePlannerTask> tasks = [];
  List<TimePlannerTitle> headers = [
    const TimePlannerTitle(
      date: "8/8/2021",
      title: "GGmonday",
    ),
    const TimePlannerTitle(
      date: "8/9/2021",
      title: "GGtuesday",
    ),
  ];
  late DateTime newDay = DateTime.now();

  void _addObject(BuildContext context) {
    List<Color?> colors = [
      Colors.purple,
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.lime[600]
    ];

    setState(() {
      tasks.add(
        TimePlannerTask(
          color: colors[Random().nextInt(colors.length)],
          dateTime: TimePlannerDateTime(
              day: Random().nextInt(14),
              hour: Random().nextInt(18) + 6,
              minutes: Random().nextInt(60)),
          minutesDuration: Random().nextInt(90) + 30,
          //daysDuration: Random().nextInt(4) + 1,
          daysDuration: 1,
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('You click on time planner object')));
          },
          child: Text(
            'this is a demo',
            style: TextStyle(color: Colors.grey[350], fontSize: 12),
          ),
        ),
      );
    });

    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Random task added to time planner!')));
  }

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now().add(const Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          headers.add(
            const TimePlannerTitle(
              date: "8/9/2021",
              title: "GGday",
            ),
          );
          newDay = newDate;
        });
        print(headers);
        print(headers[0].title);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: ElevatedButton(
          onPressed: setDate,
          child: Text(
            DateFormat('d/M/y').format(newDay),
          ),
        ),
        title: const Text(
          'Planning Etam Rodez',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: TimePlanner(
          startHour: 9,
          endHour: 19,
          style: TimePlannerStyle(
            // cellHeight: 60,
            // cellWidth: 60,
            showScrollBar: true,
          ),
          headers: headers
              .map((e) => TimePlannerTitle(
                    title: e.title,
                    date: e.date,
                  ))
              .toList(),
          // headers: const [
          //   TimePlannerTitle(
          //     date: "3/11/2021",
          //     title: "monday",
          //   ),
          //   TimePlannerTitle(
          //     date: "3/12/2021",
          //     title: "tuesday",
          //   ),
          //   TimePlannerTitle(
          //     date: "3/13/2021",
          //     title: "wednesday",
          //   ),
          //   TimePlannerTitle(
          //     date: "3/14/2021",
          //     title: "thursday",
          //   ),
          //   TimePlannerTitle(
          //     date: "3/15/2021",
          //     title: "friday",
          //   ),
          //   TimePlannerTitle(
          //     date: "3/16/2021",
          //     title: "saturday",
          //   ),
          //   TimePlannerTitle(
          //     date: "3/17/2021",
          //     title: "sunday",
          //   ),
          // ],
          tasks: tasks,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addObject(context),
        tooltip: 'Add random task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
