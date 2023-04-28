import 'package:etam_planning/models/time_day_planning.dart';
import 'package:etam_planning/providers/color_provider.dart';
import 'package:etam_planning/views/cells.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ColorsProvider colorsProvider = ColorsProvider();
  late DateTime newDay = DateTime.now();
  List<TimeDayPlanning> dayPlanning = [
    // TimeDayPlanning(
    //   day: 'Lundi',
    //   date: DateTime.now(),
    // )
  ];
  Color setColor = Colors.redAccent;
  double heightCell = 50;

  void setDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2025),
    ).then((newDate) {
      if (newDate != null) {
        setState(() {
          newDay = newDate;
          dayPlanning.add(TimeDayPlanning(
            day: DateFormat("EEEE", 'fr').format(newDay),
            date: DateFormat("MMMMd", 'fr').format(newDay),
          ));
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color nathColors =
        Provider.of<ColorsProvider>(context, listen: true).nathColors;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Planning Etam Rodez',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(top: 10, left: 10, bottom: 10),
        child: SizedBox(
          //height: 50,
          child: Row(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: setDate,
                      // onPressed: () => {
                      //   //print(DateFormat('d/M').format(newDay))
                      //   print(newDay),
                      //   print(DateFormat("MMMMEEEEd", 'fr').format(newDay)),
                      //   print(DateFormat("EEEE", 'fr').format(newDay)),
                      //   print(DateFormat("MMMMd", 'fr').format(newDay))
                      //
                      // },
                      child: const Icon(
                        Icons.add,
                      ),
                    ),
                    Container(
                      height: 5,
                    ),
                    Container(
                      height: heightCell,
                      child: Text("9:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("10:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("11:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("12:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("13:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("14:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("15:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("16:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("17:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("18:00"),
                    ),
                    Container(
                      height: heightCell,
                      child: Text("19:00"),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: dayPlanning.length,
                itemBuilder: (BuildContext context, int index) {
                  //var ggday = dayPlanning[index];
                  return Container(
                    //padding: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          width: 1,
                          color: Colors.blue,
                        ),
                        bottom: BorderSide(
                          width: 1,
                          color: Colors.blue,
                        ),
                        left: BorderSide(
                          width: 1,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    //color: Colors.blue,
                    width: 100,
                    // height: 100,

                    child: Column(
                      children: [
                        InkWell(
                          onLongPress: () async {
                            if (await confirm(context,
                                content:
                                    const Text('Confirmez suppression du jour'),
                                textOK: const Text('Ok'),
                                textCancel: const Text('Annuler'))) {
                              setState(() {
                                dayPlanning.removeAt(index);
                              });
                            } else {
                              print('onLongPress cancel');
                            }

                            //print(dayPlanning[0].date);
                          },
                          child: SizedBox(
                            height: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dayPlanning[index].day,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  dayPlanning[index].date,
                                  style: const TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                Container(
                                  //margin: const EdgeInsets.only(bottom: 5),
                                  height: 1,
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        width: 1,
                                        color: Colors.blue,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                        Container(
                          height: heightCell / 2,
                          child: const Cells(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue,
                        ),
                        Container(
                          height: heightCell / 2,
                          child: const Cells(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue,
                        ),
                        Container(
                          height: heightCell / 2,
                          child: const Cells(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue,
                        ),
                        Container(
                          height: heightCell / 2,
                          child: const Cells(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue,
                        ),
                        Container(
                          height: heightCell / 2,
                          child: const Cells(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue,
                        ),
                        Container(
                          height: heightCell / 2,
                          child: const Cells(),
                        ),
                        Container(
                          width: double.infinity,
                          height: 1,
                          color: Colors.blue,
                        ),
                        // Row(
                        //   children: [
                        //     Container(
                        //       //width: double.infinity,
                        //       width: 33,
                        //       height: heightCell/2,
                        //       child: const Cells(),
                        //     ),Container(
                        //       //width: double.infinity,
                        //       width: 33,
                        //       height: heightCell/2,
                        //       child: const Cells(),
                        //     ),Container(
                        //       //width: double.infinity,
                        //       width: 33,
                        //       height: heightCell/2,
                        //       child: const Cells(),
                        //     ),
                        //   ],
                        // ),

                        // Ink(
                        //   color: Colors.green,
                        //   child: const Column(
                        //     children: [
                        //       Cells(),
                        //     ],
                        //   ),
                        // ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
