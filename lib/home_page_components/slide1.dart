// ignore_for_file: unnecessary_null_comparison

// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'calendar1.dart';
import "carousel.dart";
// import "calender.dart";
// import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home_page_components/home_screen.dart';
// import 'package:syncfusion_flutter_calendar/calendar.dart';
// import 'package:table_calendar/table_calendar.dart';
// import 'package:intl/intl.dart';
// import 'dart:math';

// class slider1 extends StatelessWidget {
//   // late PanelController _panelController;
//   final _panelController = PanelController();
//   List<Meeting> _todayMeetings = [];
//   late MeetingDataSource _dataSource;
//   @override
//   void initState() {
//     // Initialize today's meetings
//     final DateTime today = DateTime.now();
//     _todayMeetings = (_dataSource.appointments!.where((meeting) =>
//         meeting.from.year == today.year &&
//         meeting.from.month == today.month &&
//         meeting.from.day == today.day) as List<Meeting>);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SlidingUpPanel(
//             controller: _panelController,
//             minHeight: 100,
//             maxHeight: MediaQuery.of(context).size.height * 0.8,

//             panelBuilder: (scrollController) {
//               return SingleChildScrollView(

//                 controller: scrollController,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     CarouselWithIndicator(),
//                     const Padding(
//                       padding:
//                           EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//                       child: Text(
//                         'Today\'s Schedule',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     if (_todayMeetings.isNotEmpty)
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: const NeverScrollableScrollPhysics(),
//                         itemCount: _todayMeetings.length,
//                         itemBuilder: (BuildContext context, int index) {
//                           final Meeting meeting = _todayMeetings[index];
//                           return ListTile(
//                             title: Text(meeting.eventName),
//                             subtitle: Text(
//                                 '${meeting.from.hour}:${meeting.from.minute.toString().padLeft(2, '0')} - ${meeting.to.hour}:${meeting.to.minute.toString().padLeft(2, '0')}'),
//                             leading: Container(
//                               width: 12,
//                               height: 12,
//                               decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
// // color: meeting.backgroundColor,
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                     if (_todayMeetings.isEmpty)
//                       const Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 16),
//                         child: Text('No meetings today'),
//                       ),

//                   ],
//                 ),
//               );
//             }));
//   }
// }

// version 2
// class slider1 extends StatefulWidget {
//   const slider1({Key? key}) : super(key: key);

//   @override
//   _TodaySchedulePanelState createState() => _TodaySchedulePanelState();
// }

// class _TodaySchedulePanelState extends State<slider1> {
//   Meeting? _selectedEvent;
//   Meeting? _selectedAppointment;

//   List<Meeting> _getDataSource() {
//     // Replace this with your own data source
//     final List<Meeting> meetings = <Meeting>[];
//     final DateTime today = DateTime.now();
//     final DateTime startTime =
//         DateTime(today.year, today.month, today.day, 9, 0, 0);
//     final DateTime endTime =
//         DateTime(today.year, today.month, today.day, 10, 0, 0);
//     return [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     final today = DateTime.now();
//     final appointments = _getDataSource().where((meeting) =>
//         meeting.from.year == today.year &&
//         meeting.from.month == today.month &&
//         meeting.from.day == today.day).toList();
//     return Scaffold(
//         body: SlidingUpPanel(
//           minHeight: 80,
//   maxHeight: MediaQuery.of(context).size.height * 0.7,
//   panelBuilder: (ScrollController sc) => _scrollingList(sc),
//   borderRadius: const BorderRadius.only(
//     topLeft: Radius.circular(18.0),
//     topRight: Radius.circular(18.0),
//   ),
//   body: GestureDetector(
//     onTap: () {
//       if (_selectedAppointment == null) {
//         return;
//       }
//     },

//     child: CarouselWithIndicator(), // add your widgets here
//     ),
//   ),
//         );

//   }

//   Widget _scrollingList(ScrollController sc) {
//     return Container(
//       height: 80,
//       decoration: BoxDecoration(
//         color: Colors.blueGrey[50],
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black.withOpacity(0.2),
//             blurRadius: 10,
//             offset: const Offset(0, -5),
//           ),
//         ],
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Expanded(
//             child: Padding(
//               padding: const EdgeInsets.all(16),
//               child: Text(
//                 'Today\'s Schedule',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8),
//             child: _selectedAppointment != null
//                 ? Text(_selectedAppointment!.title)
//                 : Text('No appointments'),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onEventSelected(Meeting event) {
//     setState(() {
//       _selectedEvent = event;
//       final today = DateTime.now();
//       final appointments = _getDataSource()
//           .where((meeting) =>
//               meeting.from.year == today.year &&
//               meeting.from.month == today.month &&
//               meeting.from.day == today.day)
//           .toList();
//       if (appointments.isNotEmpty) {
//         _selectedAppointment = appointments.first;
//       } else {
//         _selectedAppointment = null;
//       }
//     });
//   }
// }

// class Meeting {
//   final String title;
//   final DateTime from;
//   final DateTime to;

//   Meeting({
//     required this.title,
//     required this.from,
//     required this.to,
//   });
// }

// // version 3 - woriking static
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:weather_icons/weather_icons.dart';

class MyPanelController {}

class Slider1 extends PanelController {}

class MySlidingUpPanel extends StatefulWidget {
  @override
  _MySlidingUpPanelState createState() => _MySlidingUpPanelState();
}

class _MySlidingUpPanelState extends State<MySlidingUpPanel> {
  final panelController = Slider1();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
          controller: panelController,
          // minHeight: 80.0,
          // minHeight: 149,
          minHeight: 450,
          maxHeight: MediaQuery.of(context).size.height * 0.8,
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          panel: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.0),
                    Center(
                      child: Container(
                        width: 50.0,
                        height: 5.0,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 100, 58, 42),
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      "Monday",
                      style: TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                        // fontFamily: "Montserrat-ExtraBold"
                        color: Color.fromARGB(255, 100, 58, 42),
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      "ESPECIALLY MADE FOR YOU",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 138, 88, 69),
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      "Dress shabbily and they remember the dress; dress impeccably and they remember the woman. - Coco Chanel",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 161, 121, 107)),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      "FORECAST",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 138, 88, 69),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Container(
                      height: 115.0,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          _buildWeatherTile(
                              "9:00", WeatherIcons.day_sunny, "27°C"),
                          _buildWeatherTile(
                              "10:00", WeatherIcons.cloudy_windy, "28°C"),
                          _buildWeatherTile(
                              "11:00", WeatherIcons.day_cloudy, "28°C"),
                          _buildWeatherTile(
                              "12:00", WeatherIcons.day_sunny, "29°C"),
                          _buildWeatherTile(
                              "14:00", WeatherIcons.day_hail, "31°C"),
                          _buildWeatherTile(
                              "15:00", WeatherIcons.day_hail, "31°C"),
                          _buildWeatherTile("16:00", WeatherIcons.rain, "29°C"),
                        ],
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "TIPS FOR TODAY",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 138, 88, 69),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    Text(
                      "Fashion fades, only style remains the same. - Coco Chanel",
                      style: TextStyle(
                          fontSize: 15.0,
                          color: Color.fromARGB(255, 161, 121, 107)),
                    ),
                    SizedBox(height: 28.0),
                    Text(
                      "TODAY'S SCHEDULE",
                      style: TextStyle(
                        fontSize: 15.0,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 138, 88, 69),
                      ),
                    ),
                    SizedBox(height: 12.0),
                    _buildTaskTile("9:00 AM\n10:00 AM",
                        "\u2022 Meeting with Client A", "Office"),
                    _buildTaskTile("12:00 AM\n1:00 PM",
                        "\u2022 Design Review Meeting", "Design Lab"),
                    _buildTaskTile("1:00 PM\n2:00 AM",
                        "\u2022 Lunch with Friends", "Cafe"),
                    _buildTaskTile(
                        "3:00 PM\n5:00 AM", "\u2022 Movie", "Theatre"),
                    SizedBox(height: 24.0),
                    Text(
                      "ITEMS IN THIS OUTFIT",
                      style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 161, 121, 107)),
                    ),
                    SizedBox(height: 12.0),
                    GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16.0,
                      mainAxisSpacing: 12.0,
                      shrinkWrap: true,
                      // physics: NeverScrollableScrollPhysics(),
                      physics: AlwaysScrollableScrollPhysics(),
                      children: [
                        // _buildCategoryTile("Fashion", Icons.style),
                        // _buildCategoryTile("Food", Icons.fastfood),
                        // _buildCategoryTile("Travel", Icons.flight),
                        // _buildCategoryTile("Fitness", Icons.fitness_center),
                        // Image.asset("tops.jpg"),
                        // Image.asset("bags.jpg"),
                        // Image.asset("shoes.jpg"),
                        // Image.asset("bottoms.jpg"),

                        _buildCategoryTile("tops.jpg", "tops"),
                        _buildCategoryTile("bags.jpg", "bags"),
                        _buildCategoryTile("shoes.jpg", "shoes"),
                        _buildCategoryTile("bottoms.jpg", "bottoms"),
                      ],
                    ),
                  ]),
            ),
          ),
          // body: Container(
          //   color: Colors.white,
          //   child: Center(
          //     child: Text(
          //       "This is the main content",
          //       style: TextStyle(fontSize: 24.0),
          //     ),
          //   ),
          // ),
          body: SingleChildScrollView(
              child: Column(
                  // color: Colors.blueGrey,
                  children: [
                CarouselWithIndicator(),
                // CalendarPage(),
              ]))),
    );
  }

  Widget _buildWeatherTile(String day, IconData icon, String temperature) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(
          // color: Colors.grey[200],
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 80.0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                day,
                style: TextStyle(
                    fontSize: 15.0,
                    // fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 161, 121, 107)),
              ),
              SizedBox(height: 12.0),
              // Text(
              // Icon,
              // style: TextStyle(fontSize: 16.0),
              // )
              Icon(
                icon,
                size: 20.0,
                // color: Colors.grey,
              ),
              SizedBox(height: 15.0, width: double.infinity),

              Text(
                temperature,
                style: TextStyle(
                  fontSize: 15.0,
                  color: Color.fromARGB(255, 161, 121, 107),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Widget _buildTaskTile(String task) {
  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 8.0),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Icon(Icons.check_circle_outline),
  //         SizedBox(width: 12.0),
  //         Expanded(
  //           child: Text(
  //             task,
  //             style: TextStyle(fontSize: 16.0),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildTaskTile(String time, String schedule, String location) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(width: 10, height: 10, decoration:
              // BoxDecoration(shape: BoxShape.circle, color: Colors.black),),
              Text(
                schedule,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                  color: Color.fromARGB(255, 100, 58, 42),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 8),
                child: Text(
                  location,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
              )
            ],
          ),
          Text(
            time,
            style: TextStyle(
              // fontWeight: FontWeight.bold,
              fontSize: 12.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildCategoryTile(String title, IconData icon) {
  Widget _buildCategoryTile(String imgPath, String title) {
    return Container(
      // decoration: BoxDecoration(
      //   color: Colors.grey[200],
      //   borderRadius: BorderRadius.circular(12.0),
      // ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon(
          //   icon,
          //   size: -20,
          //   color: Colors.grey,
          // ),
          // SizedBox(height: -40.0),
          // image,
          Hero(
              tag: imgPath,
              child: Container(
                  height: 180.0,
                  width: 220.0,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(imgPath), fit: BoxFit.cover)))),

          SizedBox(height: 12.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

// version 4
// class UserInformation extends StatefulWidget {
//   @override
//   _UserInformationState createState() => _UserInformationState();
// }

// class _UserInformationState extends State<UserInformation> {
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('appointments').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//        final today = DateTime.now();
// final appointments = snapshot.data!.docs.where((doc) {
//   final startDateTime = DateTime.parse(doc['startTime']).toLocal();
//   return startDateTime.year == today.year &&
//       startDateTime.month == today.month &&
//       startDateTime.day == today.day;
// }).toList();

//         if (appointments.isEmpty) {
//           return Text('No appointments for today');
//         }

//         return ListView(
//           children: appointments.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['id']),
//               subtitle: Text(data['startTime'].toString()),
//             );
//           }).toList(),
//         );
//       },
//     );
//   }
// }

// version 5 - not working
// class MyPanelController {
// }

// class Slider1 extends PanelController {}

// class MySlidingUpPanel extends StatefulWidget {
//   @override
//   _MySlidingUpPanelState createState() => _MySlidingUpPanelState();
// }

// class _MySlidingUpPanelState extends State<MySlidingUpPanel> {
//   final panelController = Slider1();
//   final Stream<QuerySnapshot> _usersStream =
//       FirebaseFirestore.instance.collection('appointments').snapshots();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SlidingUpPanel(
//           controller: panelController,
//           // minHeight: 80.0,
//           minHeight: 149,
//           // minHeight: 288,
//           maxHeight: MediaQuery.of(context).size.height * 0.8,
//           borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
//           panel: SingleChildScrollView(

//             child: Padding(

//               padding: const EdgeInsets.all(12.0),
//               child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,

//                   children: [
//                     SizedBox(height: 16.0),
//                     Center(
//               child: Container(
//                 width: 50.0,
//                 height: 5.0,
//                 decoration: BoxDecoration(
//                   color: Color.fromARGB(255, 100, 58, 42),
//                   borderRadius: BorderRadius.circular(24.0),
//                 ),
//               ),),
//                     SizedBox(height: 40.0),
//                     Text(
//                       "Monday",
//                       style: TextStyle(
//                         fontSize: 25.0,
//                         fontWeight: FontWeight.bold,
//                         // fontFamily: "Montserrat-ExtraBold"
//                         color: Color.fromARGB(255, 100, 58, 42),

//                       ),
//                     ),
//                     SizedBox(height: 5.0),
//                     Text(
//                       "ESPECIALLY MADE FOR YOU",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         color: Color.fromARGB(255, 138, 88, 69),
//                         fontWeight: FontWeight.bold
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     Text(
//                       "Dress shabbily and they remember the dress; dress impeccably and they remember the woman. - Coco Chanel",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         color: Color.fromARGB(255, 161, 121,107)
//                       ),
//                     ),
//                     SizedBox(height: 24.0),
//                     Text(
//                       "FORECAST",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 138, 88, 69),
//                       ),
//                     ),
//                     SizedBox(height: 12.0),
//                     // Container(
//                     //   height: 200.0,
//                     //   child: Expanded(child: ListView(
//                     //     scrollDirection: Axis.horizontal,
//                     //     children: [
//                     //       _buildWeatherTile("9:00", WeatherIcons.day_sunny, "27°C"),
//                     //       _buildWeatherTile("10:00", WeatherIcons.cloudy_windy, "28°C"),
//                     //       _buildWeatherTile("11:00", WeatherIcons.day_cloudy, "28°C"),
//                     //       _buildWeatherTile("12:00", WeatherIcons.day_sunny, "29°C"),
//                     //       _buildWeatherTile("14:00", WeatherIcons.day_hail, "31°C"),
//                     //       _buildWeatherTile("15:00", WeatherIcons.day_hail, "31°C"),
//                     //       _buildWeatherTile("16:00", WeatherIcons.rain, "29°C"),
//                     //     ],
//                     //   )),
//                     // ),
//                     SizedBox(height: 12.0),
//                     Text(
//                       "TIPS FOR TODAY",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 138, 88, 69),
//                       ),
//                     ),
//                     SizedBox(height: 12.0),
//                     Text(
//                       "Fashion fades, only style remains the same. - Coco Chanel",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         color: Color.fromARGB(255, 161, 121,107)
//                       ),
//                     ),
//                     SizedBox(height: 28.0),
//                     Text(
//                       "TODAY'S SCHEDULE",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,

//                         color: Color.fromARGB(255, 138, 88, 69),
//                       ),
//                     ),
//                     SizedBox(height: 12.0),
//                     // _buildTaskTile("9:00 AM\n10:00 AM", "\u2022 Meeting with Client A", "Office"),
//                     // _buildTaskTile("12:00 AM\n1:00 PM", "\u2022 Design Review Meeting", "Design Lab"),
//                     // _buildTaskTile("1:00 PM\n2:00 AM" ,"\u2022 Lunch with Friends", "Cafe"),
//                     // _buildTaskTile("3:00 PM\n5:00 AM", "\u2022 Movie", "Theatre"),
//                     buildtoday(context),
//                     SizedBox(height: 24.0),
//                     Text(
//                       "ITEMS IN THIS OUTFIT",
//                       style: TextStyle(
//                         fontSize: 15.0,
//                         fontWeight: FontWeight.bold,
//                         color: Color.fromARGB(255, 161, 121,107)
//                       ),
//                     ),
//                     SizedBox(height: 12.0),
//                     GridView.count(
//                       crossAxisCount: 2,
//                       crossAxisSpacing: 16.0,
//                       mainAxisSpacing: 12.0,
//                       shrinkWrap: true,
//                       // physics: NeverScrollableScrollPhysics(),
//                       physics: AlwaysScrollableScrollPhysics(),
//                       children: [
//                         // _buildCategoryTile("Fashion", Icons.style),
//                         // _buildCategoryTile("Food", Icons.fastfood),
//                         // _buildCategoryTile("Travel", Icons.flight),
//                         // _buildCategoryTile("Fitness", Icons.fitness_center),
//                         // Image.asset("tops.jpg"),
//                         // Image.asset("bags.jpg"),
//                         // Image.asset("shoes.jpg"),
//                         // Image.asset("bottoms.jpg"),

//                         _buildCategoryTile("tops.jpg", "tops"),
//                         _buildCategoryTile("bags.jpg", "bags"),
//                         _buildCategoryTile("shoes.jpg", "shoes"),
//                         _buildCategoryTile("bottoms.jpg", "bottoms"),
//                       ],
//                     ),
//                   ]),
//             ),
//           ),
//           // body: Container(
//           //   color: Colors.white,
//           //   child: Center(
//           //     child: Text(
//           //       "This is the main content",
//           //       style: TextStyle(fontSize: 24.0),
//           //     ),
//           //   ),
//           // ),
//           body: SingleChildScrollView(
//               child: Column(
//                   // color: Colors.blueGrey,
//                   children: [
//                 CarouselWithIndicator(),
//                 // CalendarPage(),
//               ]))),
//     );
//   }

//   Widget _buildWeatherTile(String day, IconData icon,String temperature) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           // color: Colors.grey[200],
//           borderRadius: BorderRadius.circular(4.0),
//         ),
//         width: 80.0,
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 day,
//                 style: TextStyle(
//                   fontSize: 15.0,
//                   // fontWeight: FontWeight.bold,
//                   color: Color.fromARGB(255, 161, 121,107)
//                 ),
//               ),
//               SizedBox(height: 12.0),
//               // Text(
//                 // Icon,
//                 // style: TextStyle(fontSize: 16.0),
//               // )
//               Icon(
//             icon,
//             size: 20.0,
//             // color: Colors.grey,
//           ),
//               SizedBox(height: 15.0, width: double.infinity),

//               Text(
//                 temperature,
//                 style: TextStyle(fontSize: 15.0,
//                 color: Color.fromARGB(255, 161, 121, 107),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Widget _buildTaskTile(String task) {
//   //   return Padding(
//   //     padding: const EdgeInsets.only(bottom: 8.0),
//   //     child: Row(
//   //       crossAxisAlignment: CrossAxisAlignment.start,
//   //       children: [
//   //         Icon(Icons.check_circle_outline),
//   //         SizedBox(width: 12.0),
//   //         Expanded(
//   //           child: Text(
//   //             task,
//   //             style: TextStyle(fontSize: 16.0),
//   //           ),
//   //         ),
//   //       ],
//   //     ),
//   //   );
//   // }

//     Widget _buildTaskTile(String time, String schedule, String location) {
//     return Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Container(width: 10, height: 10, decoration:
//               // BoxDecoration(shape: BoxShape.circle, color: Colors.black),),
//               Text(
//                 schedule,
//                 style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 14.0,
//                   color: Color.fromARGB(255, 100, 58, 42),
//                 ),
//               ),
//                 Container(
//              padding: EdgeInsets.only(left: 8),
//               child: Text(
//                 location,
//                 style: TextStyle(
//                   fontSize: 14.0,
//                   color: Colors.grey[600],
//                 ),
//               ),)
//             ],
//           ),
//           Text(
//             time,
//             style: TextStyle(
//               // fontWeight: FontWeight.bold,
//               fontSize: 12.0,
//               color: Colors.black,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//     Widget buildtoday(BuildContext context) {
//     return
//     Padding(
//       padding: EdgeInsets.all(8.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [StreamBuilder<QuerySnapshot>(
//       stream: _usersStream,
//       builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//         if (snapshot.hasError) {
//           return Text('Something went wrong');
//         }

//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Text("Loading");
//         }

//        final today = DateTime.now();
// final appointments = snapshot.data!.docs.where((doc) {
//   final startDateTime = DateTime.parse(doc['startTime']).toLocal();
//   return startDateTime.year == today.year &&
//       startDateTime.month == today.month &&
//       startDateTime.day == today.day;
// }).toList();

//         if (appointments.isEmpty) {
//           return Text('No appointments for today');
//         }

//         return ListView(
//           children: appointments.map((DocumentSnapshot document) {
//             Map<String, dynamic> data =
//                 document.data()! as Map<String, dynamic>;
//             return ListTile(
//               title: Text(data['id']),
//               subtitle: Text(data['startTime'].toString()),
//             );
//           }).toList(),
//         );
//       },
//     )])]));
//   }

//   // Widget _buildCategoryTile(String title, IconData icon) {
//     Widget _buildCategoryTile(String imgPath, String title) {
//     return Container(
//       // decoration: BoxDecoration(
//       //   color: Colors.grey[200],
//       //   borderRadius: BorderRadius.circular(12.0),
//       // ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,

//         children: [

//           // Icon(
//           //   icon,
//           //   size: -20,
//           //   color: Colors.grey,
//           // ),
//           // SizedBox(height: -40.0),
//           // image,
//           Hero(
//                       tag: imgPath,
//                       child: Container(
//                           height: 198.0,
//                           width: 220.0,
//                           decoration: BoxDecoration(
//                               image: DecorationImage(
//                                   image: AssetImage(imgPath),
//                                   fit: BoxFit.cover))
//                                   )
//                                   ),

//           SizedBox(height: 12.0),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 18.0,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }

// }
