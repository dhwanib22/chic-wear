import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile_Page/outfit_detail.dart';

class OutfitPage extends StatelessWidget {
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
                      OutfitDetail(assetPath: imgPath, fitname: name)));
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
                  Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            isFavorite
                                ? const Icon(Icons.favorite,
                                    color: Color(0xFFEF7532))
                                : const Icon(Icons.favorite_border,
                                    color: Color(0xFFEF7532))
                          ])),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 140.0,
                          width: 125.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 7.0),
                  Text(name,
                      style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Varela',
                          fontSize: 18.0)),

                  SizedBox(height: 7.0),
                  // Padding(
                  //     padding: const EdgeInsets.all(8.0),
                  //     child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                  // Padding(
                  //     padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                  //     child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           if (!added) ...[
                  //             // const Icon(Icons.shopping_basket,
                  //             //     color: Color(0xFFD17E50), size: 12.0),
                  //             const Text('Create Fit',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: Color(0xFFD17E50),
                  //                     fontSize: 12.0))
                  //           ],
                  //           if (added) ...[
                  //             // const Icon(Icons.remove_circle_outline,
                  //             //     color: Color(0xFFD17E50), size: 12.0),
                  //             const Text('Create Fit',
                  //                 style: TextStyle(
                  //                     fontFamily: 'Varela',
                  //                     color: Color(0xFFD17E50),
                  //                     fontWeight: FontWeight.bold,
                  //                     fontSize: 12.0)),
                  //             // const Icon(Icons.add_circle_outline,
                  //             //     color: Color(0xFFD17E50), size: 12.0),
                  //           ]
                  //         ]))
                ]))));
  }
}
