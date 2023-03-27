import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page_components/home_screen.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'dart:math';

// import 'slide1.dart';
// import 'package:firebase_database/firebase_database.dart';

// import 'package:firebase_core/firebase_core.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';

// final DatabaseReference databaseReference =
//     FirebaseDatabase.instance.reference();

// Working verison
// class MyCalendar1 extends StatefulWidget {
//   // final void Function(Meeting?) onAppointmentSelected;

//   // const MyCalendar1({Key? key, required this.onAppointmentSelected}) : super(key: key);
//   const MyCalendar1({Key? key}) : super(key: key);

//   @override
//   _MyCalendar1State createState() => _MyCalendar1State();
// }

// class _MyCalendar1State extends State<MyCalendar1> {
//   late MeetingDataSource _dataSource;
//   late TextEditingController _startTimeController;
//   late TextEditingController _endTimeController;
//   Meeting? _selectedAppointment;
//   late Meeting _selectedEvent;
//   late List<Meeting> _todayMeetings;

//   void _onEventSelected(Meeting event) {
//     setState(() {
//       _selectedEvent = event;
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     _dataSource = MeetingDataSource(_getDataSource());
//     _startTimeController = TextEditingController();
//     _endTimeController = TextEditingController();
//     _selectedAppointment = null;

//     _selectedAppointment = Meeting('', DateTime.now(), DateTime.now(), Colors.orange);
//   }

//  @override
//   Widget build(BuildContext context) {
//   return MaterialApp(
//     home: Scaffold(
//       appBar: AppBar(
//         title: Text("Calendar"),
//         backgroundColor: Colors.orange,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => HomePage()),
//             );
//           },
//         ),
//       ),
//       body: Stack(
//         children: [
//           Positioned.fill(
//             child: SfCalendar(
//               view: CalendarView.month,
//               showNavigationArrow: true,
//               monthViewSettings: MonthViewSettings(showAgenda: true),
//               showDatePickerButton: true,
//               timeSlotViewSettings: TimeSlotViewSettings(
//                 startHour: 9,
//                 endHour: 16,
//               ),
//               dataSource: _dataSource,
//               onTap: calendarTapped,
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             right: 16,
//             child: ElevatedButton(
//               onPressed: () {
//                 _showAddEventDialog();
//               },
//               child: Icon(Icons.add),
//             ),
//           ),
//           Positioned(
//             bottom: 16,
//             right: 96,
//             child: ElevatedButton(
//               onPressed: () {
//                 if (_selectedAppointment != null) {
//                   _dataSource.appointments!.removeAt(
//                     _dataSource.appointments!
//                         .indexOf(_selectedAppointment));
//                   _dataSource.notifyListeners(
//                     CalendarDataSourceAction.remove,
//                     <Meeting>[]..add(_selectedAppointment!),
//                   );
//                 }
//               },
//               child: Icon(Icons.delete),
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

//   void _showAddEventDialog() async {
//   DateTime selectedDate = DateTime.now();
//   TimeOfDay startTime = TimeOfDay.now();
//   TimeOfDay endTime = startTime.replacing(hour: startTime.hour + 1);
//   String eventName = '';
//   final _random = Random();

//   // Generate a random color for the new event
//   final Color eventColor = Color.fromRGBO(
//       _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);

//   await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Add Event'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             TextField(
//               decoration: InputDecoration(
//                 labelText: 'Event name',
//               ),
//               onChanged: (value) {
//                 eventName = value;
//               },
//             ),
//             StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//               return ListTile(
//                 title: Text('Select Date'),
//                 trailing: Text(
//                   DateFormat.yMMMd().format(selectedDate),
//                 ),
//                 onTap: () async {
//                   final DateTime? date = await showDatePicker(
//                     context: context,
//                     initialDate: selectedDate,
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime(2100),
//                   );
//                   if (date != null) {
//                     setState(() {
//                       selectedDate = date;
//                     });
//                   }
//                 },
//               );
//             }),
//             StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return ListTile(
//                   title: Text('Start Time'),
//                   trailing: Text('${startTime.format(context)}'),
//                   onTap: () async {
//                     final TimeOfDay? time = await showTimePicker(
//                       context: context,
//                       initialTime: startTime,
//                     );
//                     if (time != null) {
//                       setState(() {
//                         startTime = time;
//                       });
//                     }
//                   },
//                 );
//               },
//             ),
//             StatefulBuilder(
//               builder: (BuildContext context, StateSetter setState) {
//                 return ListTile(
//                   title: Text('End Time'),
//                   trailing: Text('${endTime.format(context)}'),
//                   onTap: () async {
//                     final TimeOfDay? time = await showTimePicker(
//                       context: context,
//                       initialTime: endTime,
//                     );
//                     if (time != null) {
//                       setState(() {
//                         endTime = time;
//                       });
//                     }
//                   },
//                 );
//               },
//             ),
//           ],
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               final DateTime startDate = DateTime(
//                 selectedDate.year,
//                 selectedDate.month,
//                 selectedDate.day,
//                 startTime.hour,
//                 startTime.minute,
//               );
//               final DateTime endDate = DateTime(
//                 selectedDate.year,
//                 selectedDate.month,
//                 selectedDate.day,
//                 endTime.hour,
//                 endTime.minute,
//               );

//               // Create a new meeting with the generated color
//               final Meeting meeting =
//                   Meeting(eventName, startDate, endDate, eventColor);

//               setState(() {
//                 _dataSource.addMeeting(meeting);
//               });
//               Navigator.of(context).pop();
//             },
//             child: Text('Save'),
//           ),
//         ],
//       );
//     },
//   );
// }

//   List<Meeting> _getDataSource() {
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime =
//         DateTime(today.year, today.month, today.day, 10, 0, 0);
//     // meetings.add(Meeting('Meeting with boss', startTime, endTime));

//     return meetings;
//   }

//   // List<Meeting> _getTodayMeetings() {
//   //   final List<Meeting> meetings = <Meeting>[];
//   //   final DateTime today = DateTime.now();
//   //   _dataSource.appointments?.forEach((meeting) {
//   //     if (meeting.from.year == today.year &&
//   //         meeting.from.month == today.month &&
//   //         meeting.from.day == today.day) {
//   //       meetings.add(meeting);
//   //     }
//   //   });
//   //   return meetings;
//   // }

//     void calendarTapped(CalendarTapDetails calendarTapDetails) {
//     if (calendarTapDetails.targetElement == CalendarElement.agenda ||
//         calendarTapDetails.targetElement == CalendarElement.appointment) {
//       final Meeting appointment = calendarTapDetails.appointments![0];
//       _selectedAppointment = appointment;
//       // widget.onAppointmentSelected(_selectedAppointment);

//     }

//   }
// }

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.eventColor);

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color eventColor;

// }

// class MeetingDataSource extends CalendarDataSource {
//   MeetingDataSource(List<Meeting> source) {
//     appointments = source;
//   }

//   void addMeeting(Meeting meeting) {
//     appointments?.add(meeting);
//     notifyListeners(CalendarDataSourceAction.add, <Meeting>[meeting]);
//   }

//   @override
//   DateTime getStartTime(int index) {
//     return appointments![index].from;
//   }

//   @override
//   DateTime getEndTime(int index) {
//     return appointments![index].to;
//   }

//   @override
//   String getSubject(int index) {
//     return appointments![index].eventName;
//   }

//    @override
//   Color getColor(int index) {
//     return appointments![index].eventColor;
//   }

// }

// verison 2
class Meeting {
  Meeting(
      {required this.eventName,
      required this.from,
      required this.to,
      required this.eventColor});

  String eventName;
  DateTime from;
  DateTime to;
  Color eventColor;
}

class MyCalendar1 extends StatefulWidget {
  // final void Function(Meeting?) onAppointmentSelected;

  // const MyCalendar1({Key? key, required this.onAppointmentSelected}) : super(key: key);
  const MyCalendar1({Key? key}) : super(key: key);

  @override
  _MyCalendar1State createState() => _MyCalendar1State();
}

class _MyCalendar1State extends State<MyCalendar1> {
  late MeetingDataSource _dataSource;
  late TextEditingController _startTimeController;
  late TextEditingController _endTimeController;
  Meeting? _selectedAppointment;
  late Meeting _selectedEvent;
  late List<Meeting> _todayMeetings;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void _onEventSelected(Meeting event) {
    setState(() {
      _selectedEvent = event;
    });
  }

  void _deleteAppointment(Meeting appointment) {
    // Remove the appointment from the calendar data source
    _dataSource.appointments!.remove(appointment);
    _dataSource.notifyListeners(CalendarDataSourceAction.remove, [appointment]);

    // Remove the appointment document from Firestore
    _firestore.collection('appointments').doc(appointment.eventName).delete();
  }

  @override
  void initState() {
    super.initState();
    _dataSource = MeetingDataSource(_getDataSource());
    _startTimeController = TextEditingController();
    _endTimeController = TextEditingController();
    _selectedAppointment = null;

    // _selectedAppointment = Meeting('', DateTime.now(), DateTime.now(), Colors.orange);
    _firestore.collection('appointments').get().then((snapshot) {
      List<Meeting> appointments = snapshot.docs
          .map((doc) => Meeting(
                eventName: doc['id'],
                from: DateTime.parse(doc['startTime']),
                to: DateTime.parse(doc['endTime']),
                // subject: doc['subject'],
                eventColor: Color(doc['color']),
              ))
          .toList();

      setState(() {
        _dataSource.appointments = appointments;
      });
    });

    // Listen for changes to appointments in Firestore
    _firestore.collection('appointments').snapshots().listen((snapshot) {
      List<Meeting> appointments = snapshot.docs
          .map((doc) => Meeting(
                eventName: doc['id'],
                from: DateTime.parse(doc['startTime']),
                to: DateTime.parse(doc['endTime']),
                // subject: doc['subject'],
                eventColor: Color(doc['color']),
              ))
          .toList();

      setState(() {
        _dataSource.appointments = appointments;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calendar"),
          backgroundColor: Color.fromARGB(255, 171, 110, 88),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
              child: SfCalendar(
                view: CalendarView.month,
                showNavigationArrow: true,
                monthViewSettings: MonthViewSettings(showAgenda: true),
                showDatePickerButton: true,
                timeSlotViewSettings: TimeSlotViewSettings(
                  startHour: 9,
                  endHour: 16,
                ),
                dataSource: _dataSource,
                onTap: calendarTapped,
              ),
            ),
            Positioned(
              bottom: 16,
              right: 16,
              child: ElevatedButton(
                onPressed: () {
                  _showAddEventDialog();
                },
                style: ElevatedButton.styleFrom(
                    primary:
                        Color.fromARGB(255, 171, 110, 88) // Background color
                    ),
                child: Icon(Icons.add),
              ),
            ),
            Positioned(
              bottom: 16,
              right: 96,
              child: ElevatedButton(
                onPressed: () {
                  if (_selectedAppointment != null) {
                    _dataSource.appointments!.removeAt(_dataSource.appointments!
                        .indexOf(_selectedAppointment));
                    _dataSource.notifyListeners(
                      CalendarDataSourceAction.remove,
                      <Meeting>[]..add(_selectedAppointment!),
                    );
                    _deleteAppointment(_selectedAppointment!);
                  }
                },
                style: ElevatedButton.styleFrom(
                    primary:
                        Color.fromARGB(255, 171, 110, 88) // Background color
                    ),
                child: Icon(Icons.delete),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddEventDialog() async {
    DateTime selectedDate = DateTime.now();
    TimeOfDay startTime = TimeOfDay.now();
    TimeOfDay endTime = startTime.replacing(hour: startTime.hour + 1);
    String eventName = '';
    final _random = Random();

    // Generate a random color for the new event
    final Color eventColor = Color.fromRGBO(
        _random.nextInt(256), _random.nextInt(256), _random.nextInt(256), 1);

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Event'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Event name',
                ),
                onChanged: (value) {
                  eventName = value;
                },
              ),
              StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return ListTile(
                  title: Text('Select Date'),
                  trailing: Text(
                    DateFormat.yMMMd().format(selectedDate),
                  ),
                  onTap: () async {
                    final DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate,
                      firstDate: DateTime.now(),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                      });
                    }
                  },
                );
              }),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return ListTile(
                    title: Text('Start Time'),
                    trailing: Text('${startTime.format(context)}'),
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: startTime,
                      );
                      if (time != null) {
                        setState(() {
                          startTime = time;
                        });
                      }
                    },
                  );
                },
              ),
              StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
                  return ListTile(
                    title: Text('End Time'),
                    trailing: Text('${endTime.format(context)}'),
                    onTap: () async {
                      final TimeOfDay? time = await showTimePicker(
                        context: context,
                        initialTime: endTime,
                      );
                      if (time != null) {
                        setState(() {
                          endTime = time;
                        });
                      }
                    },
                  );
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final DateTime startDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  startTime.hour,
                  startTime.minute,
                );
                final DateTime endDate = DateTime(
                  selectedDate.year,
                  selectedDate.month,
                  selectedDate.day,
                  endTime.hour,
                  endTime.minute,
                );

                // Create a new meeting with the generated color
                final Meeting meeting = Meeting(
                    eventName: eventName,
                    from: startDate,
                    to: endDate,
                    eventColor: eventColor);

                setState(() {
                  _dataSource.addMeeting(meeting);
                });
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  List<Meeting> _getDataSource() {
    final List<Meeting> meetings = <Meeting>[];
    final DateTime today = DateTime.now();
    final DateTime startTime =
        DateTime(today.year, today.month, today.day, 9, 0, 0);
    final DateTime endTime =
        DateTime(today.year, today.month, today.day, 10, 0, 0);
    // meetings.add(Meeting('Meeting with boss', startTime, endTime));

    return meetings;
  }

  // List<Meeting> _getTodayMeetings() {
  //   final List<Meeting> meetings = <Meeting>[];
  //   final DateTime today = DateTime.now();
  //   _dataSource.appointments?.forEach((meeting) {
  //     if (meeting.from.year == today.year &&
  //         meeting.from.month == today.month &&
  //         meeting.from.day == today.day) {
  //       meetings.add(meeting);
  //     }
  //   });
  //   return meetings;
  // }

  void calendarTapped(CalendarTapDetails calendarTapDetails) async {
    if (calendarTapDetails.targetElement == CalendarElement.agenda ||
        calendarTapDetails.targetElement == CalendarElement.appointment) {
      final Meeting appointment = calendarTapDetails.appointments![0];
      _selectedAppointment = appointment;
      // widget.onAppointmentSelected(_selectedAppointment);
    }

    // Store the tapped appointment details in Firebase.
    // final Meeting? tappedAppointment = calendarTapDetails.appointments?.isNotEmpty == true ? calendarTapDetails.appointments![0] : null;
    // if (tappedAppointment != null) {
    //   await _firestore.collection('appointments').doc(tappedAppointment.eventName.toString()).set({
    //     'id': tappedAppointment.eventName,
    //     'startTime': tappedAppointment.from.toString(),
    //     'endTime': tappedAppointment.to.toString(),
    //     // 'subject': tappedAppointment.subject,
    //     'color': tappedAppointment.eventColor?.value,
    //   });

    //   ScaffoldMessenger.of(context).showSnackBar(
    //     SnackBar(content: Text('Appointment added to Firebase')),
    //   );
    // }

    final Meeting? tappedAppointment =
        calendarTapDetails.appointments?.isNotEmpty == true
            ? calendarTapDetails.appointments![0]
            : null;
    if (tappedAppointment != null) {
      final appointmentRef = _firestore
          .collection('appointments')
          .doc(tappedAppointment.eventName.toString());
      await appointmentRef.set({
        'id': tappedAppointment.eventName,
        'startTime': tappedAppointment.from.toString(),
        'endTime': tappedAppointment.to.toString(),
        // 'subject': tappedAppointment.subject,
        'color': tappedAppointment.eventColor.value,
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Appointment added to Firebase')),
      );

      _firestore.collection('appointments').snapshots().listen((snapshot) {
        List<Meeting> appointments = snapshot.docs
            .map((doc) => Meeting(
                  eventName: doc['id'],
                  from: DateTime.parse(doc['startTime']),
                  to: DateTime.parse(doc['endTime']),
                  eventColor: Color(doc['color']),
                ))
            .toList();
      });
    }
  }
}

// class Meeting {
//   Meeting(this.eventName, this.from, this.to, this.eventColor);

//   String eventName;
//   DateTime from;
//   DateTime to;
//   Color eventColor;

// }

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Meeting> source) {
    appointments = source;
  }

  void addMeeting(Meeting meeting) {
    appointments?.add(meeting);
    notifyListeners(CalendarDataSourceAction.add, <Meeting>[meeting]);
  }

  @override
  DateTime getStartTime(int index) {
    return appointments![index].from;
  }

  @override
  DateTime getEndTime(int index) {
    return appointments![index].to;
  }

  @override
  String getSubject(int index) {
    return appointments![index].eventName;
  }

  @override
  Color getColor(int index) {
    return appointments![index].eventColor;
  }
}
