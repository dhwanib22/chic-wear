import 'package:flutter/material.dart';
import 'package:flutter_application_1/Profile_Page/outfit_page.dart';
import 'package:flutter_application_1/Profile_Page/wadrobe_page.dart';
import 'package:flutter_application_1/Profile_Page/generate_fit_page.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 171, 110, 88),
        elevation: 0.0,
        centerTitle: false,
        // leading: IconButton(
        //   icon: Icon(Icons.arrow_back, color: Colors.black),
        //   onPressed: () {},
        // ),
        title: const Text('My Profile',
            textAlign: TextAlign.left,
            style: TextStyle(
                fontStyle: FontStyle.normal,
                fontFamily: 'Varela',
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
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          // SizedBox(height: 15.0),
          // Text('Categories',
          //     style: TextStyle(
          //         fontFamily: 'Varela',
          //         fontSize: 42.0,
          //         fontWeight: FontWeight.bold)),
          // SizedBox(height: 15.0),
          TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Color.fromARGB(255, 100, 58, 42),
              isScrollable: true,
              labelPadding: EdgeInsets.only(right: 45.0),
              unselectedLabelColor: Color(0xFFCDCDCD),
              tabs: [
                Tab(
                  child: Text('Generate Outfits',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('My Outfits',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('My Wadrobe',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                ),
                Tab(
                  child: Text('Liked Outfits',
                      style: TextStyle(
                        fontFamily: 'Varela',
                        fontSize: 21.0,
                      )),
                )
              ]),
          Container(
              height: MediaQuery.of(context).size.height - 50.0,
              width: double.infinity,
              child: TabBarView(controller: _tabController, children: [
                GenerateFitPage(),
                OutfitPage(),
                WadrobePage(),
                OutfitPage(),
              ]))
        ],
      ),
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
