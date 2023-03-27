import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home_page_components/calendar1.dart';
// import 'package:sliding_up_panel/sliding_up_panel.dart';
// import 'carousel.dart';
// import "calender.dart";
// import 'slide_panel.dart';
import 'slide1.dart';
// import 'search_bar.dart';
// import "grid_b.dart";
// import 'Carousel_slider.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
// import "persistent_Bottom_Navigation_Bar.dart";
// import 'package:outfit_generator_app/Persistent_Bottom_Navigation_Bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // bottomNavigationBar: navb();
    // home: HomeScreen();
    return Scaffold(
        // appBar: AppBar(
        //   // title: const Text('Home'),
        //   title: const Text("App"),
        //   actions: [
        //     IconButton(
        //       icon: Icon(Icons.search),
        //       onPressed: () {
        //         showSearch(context: context, delegate: DataSearch());
        //       },
        //     ),
        //   ],
        // ),

        body: Stack(children: <Widget>[
      // CarouselWithIndicator(),
      // slider()
      // Slider()
      // Slider1()
      MySlidingUpPanel()
      // UserInformation()
    ]));
  }
}


//       body: ListView(
//         children: [
//           // add other widgets here
//           CarouselWithIndicator(),
//           slider()
//           // const Padding(
//           //   padding: EdgeInsets.all(24.0),
//           // //  child: GridB(),
//           // )
//       ],
//       ),
//     );
//   }
// }

      // body: 
      // SlidingUpPanel(
      // minHeight: 149, 
      // borderRadius: BorderRadius.circular(10),
      // panel: Center(
      //   child: Text("This is the sliding Widget")
      // ),
      // // collapsed: Container(
      // //   decoration: BoxDecoration(
      // //     color: Colors.blueGrey,
      // //     borderRadius: BorderRadius.circular(10),
      // //   ),
      // // ),
      //   body: 
      //   ListView(
      //   children:[
      //    CarouselWithIndicator(),
      //    slider(),
      //   ]
      // ),
      // )
    // );
  // }
// }


