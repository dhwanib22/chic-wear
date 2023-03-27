import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import "calendar1.dart";
// // import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// void main() {
//   runApp(MyApps());
// }

// class carousel1 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       // title: 'Carousel Slider with Indicator Example',
//       home: Scaffold(
//         // appBar: AppBar(
//         //   title: Text('Create Your Own Style'),
//         // ),
//         body: Center(
//           child: CarouselSliderWithIndicator(
//             imageAssetPaths: [
//               "images/photo5.jpg",
//               // "images/photo6.jpg"
//               "images/photo8.jpg",
//               // "images/photo.jpg",
//               "images/photo1.jpg"
//               // 'images/photo2.jpg',
//               // 'images/photo4.jpg',
//               // 'assets/image5.jpg',
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class CarouselSliderWithIndicator extends StatefulWidget {
//   final List<String> imageAssetPaths;

//   const CarouselSliderWithIndicator({Key? key, required this.imageAssetPaths})
//       : super(key: key);

//   @override
//   _CarouselSliderWithIndicatorState createState() =>
//       _CarouselSliderWithIndicatorState();
// }

// class _CarouselSliderWithIndicatorState
//     extends State<CarouselSliderWithIndicator> {
//   int _current = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CarouselSlider(
//           items: widget.imageAssetPaths
//               .map((path) => Container(
//                     // width: MediaQuery.of(context).size.width,
//                     // height: 100,
//                     margin: EdgeInsets.all(6.0),
//                     decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(fit: BoxFit.fill, image: AssetImage(path)),
//               )))
//               .toList(),
//           options: CarouselOptions(
//             height: 200.0,
//             aspectRatio: 16/9,
//             viewportFraction: 1,
//             initialPage: 0,
//             enableInfiniteScroll: true,
//             reverse: false,
//             autoPlay: true,
//             autoPlayInterval: Duration(seconds: 3),
//             autoPlayAnimationDuration: Duration(milliseconds: 800),
//             autoPlayCurve: Curves.fastOutSlowIn,
//             enlargeCenterPage: true,
//             enlargeFactor: 0.3,
//               // onPageChanged: callbackFunction,
//             scrollDirection: Axis.horizontal,
//             onPageChanged: (index, reason) {
//               setState(() {
//                 _current = index;
//               });
//             },
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: widget.imageAssetPaths.map((path) {
//             int index = widget.imageAssetPaths.indexOf(path);
//             return Container(
//               width: 8.0,
//               height: 8.0,
//               margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 color: _current == index ? Colors.black : Colors.grey,
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
import "calender.dart";

class CarouselWithIndicator extends StatefulWidget {
  @override
  _CarouselWithIndicatorState createState() => _CarouselWithIndicatorState();
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicator> {
  final List<String> images = [
    // "images/photo5.jpg",
//               // "images/photo6.jpg"
    // "images/photo8.jpg",
//               // "images/photo.jpg",
    // "images/photo1.jpg"
    // 'images/photo2.jpg',
    "images/p1.jpg",
    "images/p2.jpg",
    "images/p3.jpg",
    "images/p4.jpg"
  ];

  int _currentSlide = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Container(
        // height: MediaQuery.of(context).size.height/2,
        // child:

        CarouselSlider(
          items: images.map((image) {
            return Container(
              // margin: EdgeInsets.all(5),
              child: ClipRRect(
                // borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 2000,
                ),
              ),
            );
          }).toList(),
          options: CarouselOptions(
              height: 400.0,
              aspectRatio: 16 / 9,
              viewportFraction: 1,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.3,
              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
              onPageChanged: (index, reason) {
                setState(() {
                  _currentSlide = index;
                });
              }),
        ),
        Positioned(
          top: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyCalendar1()),
              );
            },
            backgroundColor: Color.fromARGB(255, 171, 110, 8),
            child: Icon(Icons.calendar_today),
          ),
        ),
        // ),
        Positioned(
          left: 0,
          right: 0,
          // top: 20,
          bottom: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: images.map((image) {
              int index = images.indexOf(image);
              return Container(
                width: 8,
                height: 8,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 2),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentSlide == index
                      // ? Colors.blueAccent
                      ? Color.fromARGB(255, 100, 58, 42)
                      : Colors.white,
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
