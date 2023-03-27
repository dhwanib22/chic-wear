import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page_components/calendar1.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import "carousel.dart";
import "calender.dart";

class slider extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        minHeight: 149,
        panel: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 16.0),
              Container(
                width: 50.0,
                height: 5.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(24.0),
                ),
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item ${index + 1}'),
                    );
                  },
                ),

              ),

          //     Expanded(
          // child: Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => MyCalendar(selectedDate: DateTime.now()),
          //   ),
          // );
          //     ),
          //   ],
          // ),
            ],
          )
        ),
        body: SingleChildScrollView(
            child: Column(  
          // color: Colors.blueGrey,
          children: [
            
            CarouselWithIndicator(),
            // CalendarPage(), 
          ]
          // Center(
          //   child: Text(
          //     'Slide up panel with dash',
          //     style: TextStyle(
          //       fontSize: 24.0,
          //       color: Colors.white,
          //     ),
          //   ),
          // )
        )
      )
    ),
    );
  }
}
         