// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home_page_components/home_screen.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// // import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// // import 'dart:math';

// // class MyCalendar extends StatefulWidget {
// //   @override
// //   _MyCalendarState createState() => _MyCalendarState();
// // }

// // class _MyCalendarState extends State<MyCalendar> {
// //   late CalendarController _controller;
// //   late AppointmentDataSource _events;
// //   TextEditingController _textEditingController = TextEditingController();
// //   TimeOfDay _selectedTime = TimeOfDay.now();

// //   @override
// //   void initState() {
// //     super.initState();
// //     _controller = CalendarController();
// //     _events = AppointmentDataSource(_getCalendarDataSource());
// //   }
// // Future<void> _selectStartTime(BuildContext context, Appointment appointment) async {
// //     final TimeOfDay? picked = await showTimePicker(
// //       context: context,
// //       initialTime: TimeOfDay.fromDateTime(appointment.startTime),
// //     );
// //     if (picked != null && picked != TimeOfDay.fromDateTime(appointment.startTime)) {
// //       setState(() {
// //         appointment.startTime = DateTime(
// //           appointment.startTime.year,
// //           appointment.startTime.month,
// //           appointment.startTime.day,
// //           picked.hour,
// //           picked.minute,
// //         );
// //         if (appointment.endTime.isBefore(appointment.startTime)) {
// //           appointment.endTime = appointment.startTime.add(const Duration(hours: 1));
// //         }
// //       });
// //     }
// //   }

// // Future<void> _selectEndTime(BuildContext context, Appointment appointment) async {
// //   final TimeOfDay? picked = await showTimePicker(
// //     context: context,
// //     initialTime: TimeOfDay.fromDateTime(appointment.endTime),
// //   );
// //   if (picked != null && picked != TimeOfDay.fromDateTime(appointment.endTime)) {
// //     setState(() {
// //       appointment.endTime = DateTime(
// //         appointment.endTime.year,
// //         appointment.endTime.month,
// //         appointment.endTime.day,
// //         picked.hour,
// //         picked.minute,
// //       );
// //       if (appointment.endTime.isBefore(appointment.endTime)) {
// //         appointment.endTime = appointment.endTime.add(const Duration(hours: 1));
// //       }
// //     });
// //   }
// // }

// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //             leading: IconButton(
// //           icon: Icon(Icons.arrow_back),
// //           onPressed: () {
// //             Navigator.push(
// //               context,
// //               MaterialPageRoute(builder: (context) => HomePage()),
// //             );
// //           },
// //         )),
// //         // title: Text(
// //         //   '${_controller.displayDate!.month.toString().padLeft(2, '0')}/${_controller.displayDate!.year.toString()}',
// //         // )),
// //         floatingActionButton: Column(
// //           mainAxisAlignment: MainAxisAlignment.end,
// //           children: [
// //             SizedBox(
// //               height: 40,
// //               width: 40,
// //               child: FloatingActionButton(
// //                 onPressed: () {
// //                   showDialog(
// //                     context: context,
// //                     builder: (context) => AlertDialog(
// //                       title: Text("Add an event"),
// //                       content: Column(
// //                         mainAxisSize: MainAxisSize.min,
// //                         children: [
// //                           TextField(
// //                             controller: _textEditingController,
// //                             decoration: InputDecoration(
// //                               labelText: "Event name",
// //                               hintText: "Enter the event name",
// //                             ),
// //                           ),
// //                           SizedBox(height: 16),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               Text('Start time:'),
// //                               InkWell(
// //                                 onTap: () => _selectStartTime(context, Appointment(startTime: DateTime.now(), endTime: DateTime.now())),
// //                                 child: Container(
// //                                   padding: EdgeInsets.symmetric(
// //                                       vertical: 8, horizontal: 12),
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(8),
// //                                     color: Colors.grey[200],
// //                                   ),
// //                                   // child: Text(startTime.format(context)),
// //                                 ),

// //                               ),
// //                             ],
// //                           ),
// //                           SizedBox(height: 16),
// //                           Row(
// //                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                             children: [
// //                               Text('End time:'),
// //                               InkWell(
// //                                 onTap: () => _selectEndTime(context, Appointment(startTime: DateTime.now(), endTime: DateTime.now())),
// //                                 child: Container(
// //                                   padding: EdgeInsets.symmetric(
// //                                       vertical: 8, horizontal: 12),
// //                                   decoration: BoxDecoration(
// //                                     borderRadius: BorderRadius.circular(8),
// //                                     color: Colors.grey[200],
// //                                   ),
// //                                   // child: Text(endTime.format(context)),
// //                                 ),
// //                               ),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                       actions: [
// //                         TextButton(
// //                           onPressed: () {
// //                             Navigator.pop(context);
// //                           },
// //                           child: Text("Cancel"),
// //                         ),
// //                         TextButton(
// //                           onPressed: () {
// //                             final startTime = DateTime(
// //                               _controller.selectedDate!.year,
// //                               _controller.selectedDate!.month,
// //                               _controller.selectedDate!.day,
// //                               _selectedTime.hour,
// //                               _selectedTime.minute,
// //                             );
// //                             // final endTime = startTime.add(Duration(hours: 2));
// //                             final endTime = DateTime(
// //                               _controller.selectedDate!.year,
// //                               _controller.selectedDate!.month,
// //                               _controller.selectedDate!.day,
// //                               _selectedTime.hour,
// //                               _selectedTime.minute,
// //                             );
// //                             final Appointment app = Appointment(
// //                               startTime: startTime,
// //                               endTime: endTime,
// //                               subject: _textEditingController.text,
// //                             );
// //                             _events.appointments!.add(app);
// //                             _events.notifyListeners(
// //                               CalendarDataSourceAction.add,
// //                               <Appointment>[app],
// //                             );
// //                             Navigator.pop(context);
// //                           },
// //                           child: Text("Add"),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //                 child: Icon(Icons.add),
// //               ),
// //             ),
// //             SizedBox(
// //               height: 40,
// //               width: 40,
// //               child: FloatingActionButton(
// //                 onPressed: () {
// //                   List<dynamic> selectedDateAppointments = _events.appointments!
// //                       .where((appointment) =>
// //                           appointment.startTime.year ==
// //                               _controller.selectedDate!.year &&
// //                           appointment.startTime.month ==
// //                               _controller.selectedDate!.month &&
// //                           appointment.startTime.day ==
// //                               _controller.selectedDate!.day)
// //                       .toList();
// //                   if (selectedDateAppointments.isEmpty) {
// //                     return;
// //                   }
// //                   showDialog(
// //                     context: context,
// //                     builder: (context) {
// //                       return AlertDialog(
// //                         title: Text('Select an event to delete'),
// //                         content: SingleChildScrollView(
// //                           child: Column(
// //                             mainAxisSize: MainAxisSize.min,
// //                             children: selectedDateAppointments
// //                                 .map((appointment) => ListTile(
// //                                       title: Text(appointment.subject),
// //                                       onTap: () {
// //                                         Navigator.of(context).pop(appointment);
// //                                       },
// //                                     ))
// //                                 .toList(),
// //                           ),
// //                         ),
// //                       );
// //                     },
// //                   ).then((appointmentToDelete) {
// //                     if (appointmentToDelete != null) {
// //                       _events.appointments!.remove(appointmentToDelete);
// //                       _events.notifyListeners(
// //                         CalendarDataSourceAction.remove,
// //                         <Appointment>[appointmentToDelete],
// //                       );
// //                     }
// //                   });
// //                 },
// //                 child: Icon(Icons.delete),
// //               ),
// //             ),
// //           ],
// //         ),
// //         body: Container(
// //           child: SfCalendar(
// //             controller: _controller,
// //             view: CalendarView.month,
// //             dataSource: _events,
// //             showNavigationArrow: true,
// //             monthViewSettings: MonthViewSettings(
// //               showAgenda: true,
// //               agendaItemHeight: 70,
// //               // agendaViewHeight: 20,
// //               navigationDirection: MonthNavigationDirection.horizontal,
// //             ),
// //           ),
// //         ),
// //       ),
// //     );
// //   }

// // List<Appointment> _getCalendarDataSource() {
// //     final List<Appointment> appointments = <Appointment>[];
// //     final DateTime today = DateTime.now();
// //     final DateTime startTime = DateTime(
// //         today.year,
// //         today.month,
// //         today.day,
// //         _selectedTime.hour,
// //         _selectedTime.minute,
// //     );
// //     final DateTime endTime = DateTime.now();
// //     appointments.add(
// //         Appointment(
// //             startTime: startTime,
// //             endTime: endTime,
// //             // subject: _textEditingController.text,
// //             color: const Color(0xFF0F8644),
// //             isAllDay: false,
// //         ),
// //     );
// //     return appointments;
// // }
// // }

// // class AppointmentDataSource extends CalendarDataSource {
// //   AppointmentDataSource(List<Appointment> source) {
// //     appointments = source;
// //   }
// // }

// // class MyCalendar extends StatefulWidget {
// //   const MyCalendar({Key? key}) : super(key: key);

// //   @override
// //   _MyCalendarState createState() => _MyCalendarState();
// // }

// // class _MyCalendarState extends State<MyCalendar> {
// //   late MeetingDataSource _dataSource;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _dataSource = MeetingDataSource(_getDataSource());
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SfCalendar(
// //         view: CalendarView.month,
// //         showNavigationArrow: true,
// //         monthViewSettings: MonthViewSettings(showAgenda: true),
// //         timeSlotViewSettings: TimeSlotViewSettings(
// //           startHour: 9,
// //           endHour: 16,
// //         ),
// //         dataSource: _dataSource,
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           _showAddEventDialog();
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //     );
// //   }

// // void _showAddEventDialog() async {
// //   DateTime selectedDate = DateTime.now();
// //   TimeOfDay startTime = TimeOfDay.now();
// //   TimeOfDay endTime = startTime.replacing(hour: startTime.hour + 1);
// //   String eventName = '';

// //   await showDialog(
// //     context: context,
// //     builder: (BuildContext context) {
// //       return AlertDialog(
// //         title: Text('Add Event'),
// //         content: Column(
// //           mainAxisSize: MainAxisSize.min,
// //           children: [
// //             TextField(
// //               decoration: InputDecoration(
// //                 labelText: 'Event name',
// //               ),
// //               onChanged: (value) {
// //                 eventName = value;
// //               },
// //             ),
// //             ListTile(
// //               title: Text('Date'),
// //               trailing: Text(
// //                 DateFormat.yMMMd().format(selectedDate),
// //               ),
// //               onTap: () async {
// //                 final DateTime? date = await showDatePicker(
// //                   context: context,
// //                   initialDate: selectedDate,
// //                   firstDate: DateTime.now(),
// //                   lastDate: DateTime(2100),
// //                 );
// //                 if (date != null) {
// //                   setState(() {
// //                     selectedDate = date;
// //                   });
// //                 }
// //               },
// //             ),
// //             ListTile(
// //               title: Text('Start Time'),
// //               trailing: Text('${startTime.format(context)}'),
// //               onTap: () async {
// //                 final TimeOfDay? time = await showTimePicker(
// //                   context: context,
// //                   initialTime: startTime,
// //                 );
// //                 if (time != null) {
// //                   setState(() {
// //                     startTime = time;
// //                   });
// //                 }
// //               },
// //             ),
// //             ListTile(
// //               title: Text('End Time'),
// //               trailing: Text('${endTime.format(context)}'),
// //               onTap: () async {
// //                 final TimeOfDay? time = await showTimePicker(
// //                   context: context,
// //                   initialTime: endTime,
// //                 );
// //                 if (time != null) {
// //                   setState(() {
// //                     endTime = time;
// //                   });
// //                 }
// //               },
// //             ),
// //           ],
// //         ),
// //         actions: [
// //           TextButton(
// //             onPressed: () {
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Cancel'),
// //           ),
// //           TextButton(
// //             onPressed: () {
// //               final DateTime startDate = DateTime(
// //                 selectedDate.year,
// //                 selectedDate.month,
// //                 selectedDate.day,
// //                 startTime.hour,
// //                 startTime.minute,
// //               );
// //               final DateTime endDate = DateTime(
// //                 selectedDate.year,
// //                 selectedDate.month,
// //                 selectedDate.day,
// //                 endTime.hour,
// //                 endTime.minute,
// //               );
// //               final Meeting newMeeting = Meeting(
// //                 eventName,
// //                 startDate,
// //                 endDate,
// //                 Colors.blue,
// //                 false,
// //               );
// //               _dataSource.addMeeting(newMeeting);
// //               setState(() {});
// //               Navigator.of(context).pop();
// //             },
// //             child: Text('Add'),
// //           ),
// //         ],
// //       );
// //     },
// //   );
// // }
// // }

// // List<Meeting> _getDataSource() {
// //   final List<Meeting> meetings = <Meeting>[];
// //   final DateTime today = DateTime.now();
// //   final DateTime startTime =
// //       DateTime(today.year, today.month, today.day, 9, 0, 0);
// //   final DateTime endTime = startTime.add(const Duration(hours: 2));
// //   meetings.add(Meeting(
// //       'Conference', startTime, endTime, const Color(0xFF0F8644), false));
// //   return meetings;
// // }

// // class MeetingDataSource extends CalendarDataSource {

// //   MeetingDataSource(List<Meeting> source) {
// //     appointments = source;
// //   }

// //   @override
// //   DateTime getStartTime(int index) {
// //     return appointments![index].from;
// //   }

// //   @override
// //   DateTime getEndTime(int index) {
// //     return appointments![index].to;
// //   }

// //   @override
// //   String getSubject(int index) {
// //     return appointments![index].eventName;
// //   }

// //   @override
// //   Color getColor(int index) {
// //     return appointments![index].background;
// //   }

// //   @override
// //   bool isAllDay(int index) {
// //     return appointments![index].isAllDay;
// //   }
// // //    void addMeeting(Meeting meeting) {

// // //     appointments?.add(Appointment(
// // //       startTime: meeting.from,
// // //       endTime: meeting.to,
// // //       subject: meeting.eventName,
// // //       color: meeting.background,
// // //       isAllDay: meeting.isAllDay,
// // //     ));
// // //   }
// // // }
// //     void addMeeting(Meeting meeting) {
// //       appointments?.add(Meeting(
// //         meeting.eventName,
// //         meeting.from,
// //         meeting.to,
// //         meeting.background,
// //         meeting.isAllDay,
// //       ));
// //     }
// // }

// // class Meeting {
// //   Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

// //   String eventName;
// //   DateTime from;
// //   DateTime to;
// //   Color background;
// //   bool isAllDay;
// // }

// // Working verison
// class MyCalendar extends StatefulWidget {
//   const MyCalendar({Key? key}) : super(key: key);

//   @override
//   _MyCalendarState createState() => _MyCalendarState();
// }

// class _MyCalendarState extends State<MyCalendar> {
//   late MeetingDataSource _dataSource;
//   late TextEditingController _startTimeController;
//   late TextEditingController _endTimeController;
//   Meeting? _selectedAppointment;
//   late Meeting _selectedEvent;

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
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => HomePage()),
//               );
//             },
//           ),
//         ),
//         body: Stack(
//           children: [
//             Positioned.fill(
//               child: SfCalendar(
//                 view: CalendarView.month,
//                 showNavigationArrow: true,
//                 monthViewSettings: MonthViewSettings(showAgenda: true),
//                 showDatePickerButton: true,
//                 timeSlotViewSettings: TimeSlotViewSettings(
//                   startHour: 9,
//                   endHour: 16,
//                 ),
//                 dataSource: _dataSource,
//                 onTap: calendarTapped,
//               ),
//             ),
//             Positioned(
//               bottom: 16,
//               right: 16,
//               child: ElevatedButton(
//                 onPressed: () {
//                   _showAddEventDialog();
//                 },
//                 child: Icon(Icons.add),
//               ),
//             ),
//             Positioned(
//               bottom: 16,
//               right: 96,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_selectedAppointment != null) {
//                     _dataSource.appointments!.removeAt(_dataSource.appointments!
//                         .indexOf(_selectedAppointment));
//                     _dataSource.notifyListeners(
//                       CalendarDataSourceAction.remove,
//                       <Meeting>[]..add(_selectedAppointment!),
//                     );
//                   }
//                 },
//                 child: Icon(Icons.delete),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showAddEventDialog() async {
//     DateTime selectedDate = DateTime.now();
//     TimeOfDay startTime = TimeOfDay.now();
//     TimeOfDay endTime = startTime.replacing(hour: startTime.hour + 1);
//     String eventName = '';

//     await showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Add Event'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextField(
//                 decoration: InputDecoration(
//                   labelText: 'Event name',
//                 ),
//                 onChanged: (value) {
//                   eventName = value;
//                 },
//               ),
//               StatefulBuilder(
//                   builder: (BuildContext context, StateSetter setState) {
//                 return ListTile(
//                   title: Text('Select Date'),
//                   trailing: Text(
//                     DateFormat.yMMMd().format(selectedDate),
//                   ),
//                   onTap: () async {
//                     final DateTime? date = await showDatePicker(
//                       context: context,
//                       initialDate: selectedDate,
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime(2100),
//                     );
//                     if (date != null) {
//                       setState(() {
//                         selectedDate = date;
//                       });
//                     }
//                   },
//                 );
//               }),
//               StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   return ListTile(
//                     title: Text('Start Time'),
//                     trailing: Text('${startTime.format(context)}'),
//                     onTap: () async {
//                       final TimeOfDay? time = await showTimePicker(
//                         context: context,
//                         initialTime: startTime,
//                       );
//                       if (time != null) {
//                         setState(() {
//                           startTime = time;
//                         });
//                       }
//                     },
//                   );
//                 },
//               ),
//               StatefulBuilder(
//                 builder: (BuildContext context, StateSetter setState) {
//                   return ListTile(
//                     title: Text('End Time'),
//                     trailing: Text('${endTime.format(context)}'),
//                     onTap: () async {
//                       final TimeOfDay? time = await showTimePicker(
//                         context: context,
//                         initialTime: endTime,
//                       );
//                       if (time != null) {
//                         setState(() {
//                           endTime = time;
//                         });
//                       }
//                     },
//                   );
//                 },
//               ),
//             ],
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               //   onPressed: () {
//               //     final DateTime startDate = DateTime.combine(selectedDate, startTime);
//               // final DateTime endDate =
//               //     DateTime.combine(selectedDate, endTime);
//               onPressed: () {
//                 final DateTime startDate = DateTime(
//                   selectedDate.year,
//                   selectedDate.month,
//                   selectedDate.day,
//                   startTime.hour,
//                   startTime.minute,
//                 );
//                 final DateTime endDate = DateTime(
//                   selectedDate.year,
//                   selectedDate.month,
//                   selectedDate.day,
//                   endTime.hour,
//                   endTime.minute,
//                 );

//                 final Meeting meeting = Meeting(eventName, startDate, endDate);
//                 setState(() {
//                   _dataSource.addMeeting(meeting);
//                 });
//                 Navigator.of(context).pop();
//               },
//               child: Text('Save'),
//             ),
//           ],
//         );
//       },
//     );
//   }

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

//   void calendarTapped(CalendarTapDetails calendarTapDetails) {
//     if (calendarTapDetails.targetElement == CalendarElement.agenda ||
//         calendarTapDetails.targetElement == CalendarElement.appointment) {
//       final Meeting appointment = calendarTapDetails.appointments![0];
//       _selectedAppointment = appointment;
//     }
//   }
// }

// class Meeting {
//   Meeting(this.eventName, this.from, this.to);

//   String eventName;
//   DateTime from;
//   DateTime to;
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
// }
