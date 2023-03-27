import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile_Page/generate_fit_details.dart';

class GenerateFitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          const SizedBox(height: 15.0),
          Container(
              padding: const EdgeInsets.only(right: 15.0),
              width: MediaQuery.of(context).size.width - 30.0,
              height: MediaQuery.of(context).size.height - 50.0,
              child: GridView.count(
                crossAxisCount: 2,
                primary: false,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: 0.8,
                children: <Widget>[
                  _buildCard('Casual', 'casual.jpeg', false, false, context),
                  _buildCard('Formal', 'formal.jpeg', true, false, context),
                  _buildCard(
                      'Party-wear', 'party-wear.jpg', false, true, context),
                  _buildCard(
                      'Semi-formal', 'semi-formal.jpg', true, false, context),
                  _buildCard('Boho-chic', 'boho.jpg', false, true, context),
                  _buildCard('Ethnic', 'ethnic.jpg', false, false, context)
                ],
              )),
          const SizedBox(height: 15.0)
        ],
      ),
    );
  }

  Widget _buildCard(
      String name, String imgPath, bool added, bool isFavorite, context) {
    return Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) =>
                      Generate_Fit_Detail(assetPath: imgPath, fitname: name)));
            },
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                  ),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 125.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),

                  Text(name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Varela',
                          fontSize: 14.0)),
                  Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            const Text('Create Fit',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Color.fromARGB(255, 100, 58, 42),
                                    fontSize: 12.0))
                          ]))
                ]))));
  }
}
