import 'package:flutter/material.dart';
// import 'package:cookie_proj/bottom_bar.dart';

class OutfitDetail extends StatelessWidget {
  final assetPath, fitname;

  OutfitDetail({this.assetPath, this.fitname});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 171, 110, 88),
        // backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: false,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text('My Profile',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                // fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(children: [
        SizedBox(height: 15.0),
        Padding(
          padding: EdgeInsets.only(left: 20.0),
          child: Text('Outfits',
              textAlign: TextAlign.center,
              style: TextStyle(
                  // fontFamily: 'Varela',
                  fontSize: 42.0,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(226, 11, 7, 7))),
        ),
        SizedBox(height: 15.0),
        Hero(
            tag: assetPath,
            child: Image.asset(assetPath,
                height: 300.0, width: 225.0, fit: BoxFit.contain)),
        // SizedBox(height: 20.0),
        // Center(
        //   child: Text(cookieprice,
        //       style: TextStyle(
        //           fontFamily: 'Varela',
        //           fontSize: 22.0,
        //           fontWeight: FontWeight.bold,
        //           color: Color(0xFFF17532))),
        // ),
        SizedBox(height: 10.0),
        Center(
          child: Text(fitname,
              style: TextStyle(
                  color: Colors.black,
                  // fontFamily: 'Varela',
                  fontSize: 24.0)),
        ),
        SizedBox(height: 12.0),
        Center(
          child: Container(
            width: MediaQuery.of(context).size.width - 50.0,
            child: Text(
                'Never forget a great outfit again! Browse through all your previously generated looks and keep your fashion game on point.',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Varela',
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 161, 121, 107))),
          ),
        ),
        SizedBox(height: 55.0),
        Center(
            child: Container(
                width: MediaQuery.of(context).size.width - 150.0,
                height: 50.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Color.fromARGB(255, 171, 110, 88)),
                child: Center(
                    child: Text(
                  'Fits generated for you',
                  style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ))))
      ]),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {},
      //   backgroundColor: Color(0xFFF17532),
      //   child: Icon(Icons.camera),
      // ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // // bottomNavigationBar: BottomBar(),
    );
  }
}
