// // Running Code
// // void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Carousel Slider with Indicator Example',
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Create Your Own Style'),
//         ),
//         body: Center(
//           child: CarouselSliderWithIndicator(
//             imageAssetPaths: [
//               'images/photo.jpg',
//               'images/photo1.jpg',
//               // 'images/photo2.jpg',
//               'images/photo4.jpg',
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
//               .map((path) => Image.asset(
//                     path,
//                     fit: BoxFit.cover,
//                     // height: 0,
//                     // width: ,
//                   ))
                  
//               .toList(),
//           options: CarouselOptions(
//             height: 400.0,
//             aspectRatio: 16/9,
//             viewportFraction: 0.8,
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