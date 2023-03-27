import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us',
            textAlign: TextAlign.center,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'Varela',
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 171, 110, 88),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text(
              'Chic Style',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Welcome to Chic Style! Our goal is to help you find stylish outfits that fit your unique style and personality. Whether you\'re looking for a casual everyday look or a special occasion outfit, our app has got you covered.',
              style: TextStyle(
                color: Color.fromARGB(255, 161, 121, 107),
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Our Team',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'We are a small team of fashion enthusiasts who are passionate about helping people look and feel their best. Our app is the result of months of hard work and dedication, and we hope you love it as much as we do!',
              style: TextStyle(
                color: Color.fromARGB(255, 161, 121, 107),
                fontSize: 16.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Contact Us',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'If you have any questions, comments, or feedback about our app, we would love to hear from you! You can contact us at support@outfitgeneratorapp.com.',
              style: TextStyle(
                color: Color.fromARGB(255, 161, 121, 107),
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}