// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class  MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Create your own style"),
//       ),
//       body: ListView(
        
//         children: [
//           CarouselSlider(
//               items: [
                  
//                 //1st Image of Slider
//                 Container(
//                   margin: EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: AssetImage('images/photo.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
                  
//                 ),
                  
//                 //2nd Image of Slider
//                 Container(
//                   margin: EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: AssetImage('images/photo1.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
                  
//                 //3rd Image of Slider
//                 Container(
//                   margin: EdgeInsets.all(6.0),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(8.0),
//                     image: DecorationImage(
//                       image: const AssetImage('images/photo4.jpg'),
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                 ),
                  
//                 // //4th Image of Slider
//                 // Container(
//                 //   margin: EdgeInsets.all(6.0),
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(8.0),
//                 //     image: DecorationImage(
//                 //       image: AssetImage('images/photo3.jpg'),
//                 //       fit: BoxFit.cover,
//                 //     ),
//                 //   ),
//                 // ),
                  
//                 //5th Image of Slider
//                 // Container(
//                 //   margin: EdgeInsets.all(6.0),
//                 //   decoration: BoxDecoration(
//                 //     borderRadius: BorderRadius.circular(8.0),
//                 //     image: DecorationImage(
//                 //       image: AssetImage('images/photo.jpg'),
//                 //       fit: BoxFit.cover,
//                 //     ),
//                 //   ),
//                 // ),
  
//           ],
              
//             //Slider Container properties
//               options: CarouselOptions(
//                 height: 400.0,
//                 aspectRatio: 16/9,
//                 viewportFraction: 0.8,
//                 initialPage: 0,
//                 enableInfiniteScroll: true,
//                 reverse: false,
//                 autoPlay: true,
//                 autoPlayInterval: Duration(seconds: 3),
//                 autoPlayAnimationDuration: Duration(milliseconds: 800),
//                 autoPlayCurve: Curves.fastOutSlowIn,
//                 enlargeCenterPage: true,
//                 enlargeFactor: 0.3,
//                 // onPageChanged: callbackFunction,
//                 scrollDirection: Axis.horizontal,
//               ),
//           ),
//         ],
//       ),
  
//     );
//   }
// }





// // class MyHomePage extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("create your own style"),
// //       ),
// //       body: ListView(
// //         children: [
// //           CarouselSlider(
// //             // options: CarouselOptions(height: 400.0),
// //             items: [1,2,3,4,5].map((i) {
// //               return Builder(
// //                 builder: (BuildContext context) {
// //                   return Container(
// //                     width: MediaQuery.of(context).size.width,
// //                     margin: EdgeInsets.symmetric(horizontal: 5.0),
// //                     decoration: BoxDecoration(
// //                       borderRadius: BorderRadius.circular(8.0),
// //                       image: DecorationImage(
// //                       image: AssetImage('images/photo.jpg'),
// //                       fit: BoxFit.cover,
// //                       // color: Colors.amber
// //                     ),
// //                     // child: Text('text $i', style: TextStyle(fontSize: 16.0),)
// //                   )
// //                 );
                
// //                 },
// //               );
// //             }).toList(),

// //             options: CarouselOptions(
// //                 height: 400.0,
// //                 aspectRatio: 16/9,
// //                 viewportFraction: 0.8,
// //                 // initialPage: 0,
// //                 enableInfiniteScroll: true,
// //                 reverse: false,
// //                 autoPlay: true,
// //                 autoPlayInterval: Duration(seconds: 3),
// //                 autoPlayAnimationDuration: Duration(milliseconds: 800),
// //                 autoPlayCurve: Curves.fastOutSlowIn,
// //                 enlargeCenterPage: true,
// //                 enlargeFactor: 0.3,
// //                 // onPageChanged: callbackFunction,
// //                 scrollDirection: Axis.horizontal,
// //             )
// //           )
          
// //         ]
// //       )
// //     );
// //   }

// // } 