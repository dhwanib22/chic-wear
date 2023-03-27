// import 'dart:js';

import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home_page_components/carousel.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
// import 'carousel.dart';
// import "calender.dart";
// import '../pages/sign_out.dart';
// import "../screens/login.dart";
// import "../screens/wrapper.dart";
// import "../main.dart";
// import 'package:flutter_application_1/services/auth.dart';
import 'package:flutter_application_1/Camera/camera_screen.dart';
import 'package:flutter_application_1/Profile_Page/profile_main.dart';

import "package:flutter_application_1/search_page/search.dart";
// import 'package:flutter/material.dart';
// import 'home_page_components/intro_screen.dart';
// import 'home_page_components/home_screen.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:provider/provider.dart';
// import "package:flutter_application_1/models/firebaseuser.dart";
// import '../services/auth.dart';
// import 'models/firebaseuser.dart';
// import '../firebase_options.dart';
// import '../screens/wrapper.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import "settings.dart";

class navb extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PersistentTabController _controller;
    _controller = PersistentTabController(initialIndex: 0);
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      // screens: _MyHomePageState(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style1, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    HomePage(),
    ProfilePage(),
    CameraScreen(),
    // NotificationsPage(),
    search(),
    SettingsScreen()
    // SettingsScreen()
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.home),
      title: ("Home"),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: ('Profile'),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
        icon: Icon(Icons.camera),
        title: ('Camera'),
        activeColorPrimary: CupertinoColors.black,
        inactiveColorPrimary: CupertinoColors.systemGrey),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.search),
      title: ('Search'),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
    PersistentBottomNavBarItem(
      icon: Icon(CupertinoIcons.settings),
      title: ('Settings'),
      activeColorPrimary: CupertinoColors.black,
      inactiveColorPrimary: CupertinoColors.systemGrey,
    ),
  ];
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Center(
        child: Text('This is the Search page.'),
        // child: MyCalendar()
      ),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
      ),
      body: const Center(
        child: Text('This is the Notifications page.'),
      ),
    );
  }
}

// class SettingsScreen extends StatelessWidget {

//   final user = FirebaseAuth.instance.currentUser;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   backgroundColor: Colors.green,
//       //   title: Text("GEEKS FOR GEEKS"),
//       // ),

//       // Floating Action Button using for signout
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           FirebaseAuth.instance.signOut();
//         },
          
//         child: Icon(Icons.logout_rounded),
//         backgroundColor: Colors.green,
//       ),
//     );

// }
// }


// class SettingsScreen extends StatelessWidget {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   centerTitle: true,
//       //   backgroundColor: Colors.green,
//       //   title: Text("GEEKS FOR GEEKS"),
//       // ),

//       // Floating Action Button using for signout
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await FirebaseAuth.instance.signOut();
//           Navigator.of(context).pushReplacement(
//             MaterialPageRoute(builder: (context) => Login()),
//           );
//         },
//         child: Icon(Icons.logout_rounded),
//         backgroundColor: Colors.green,
//       ),
//     );
//   }
// }


//   // final FirebaseAuth auth = FirebaseAuth.instance;
//   final AuthService _auth = new AuthService();

// // Future<void> _signOut(BuildContext context) async {
// //     await auth.signOut();
// //     await Future.delayed(Duration.zero);
// //     Navigator.pushNamedAndRemoveUntil(
// //         context, '/login', (Route<dynamic> route) => false);
// // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.green,
//         title: Text("GEEKS FOR GEEKS"),
//       ),

//       // Floating Action Button using for signout
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async{
//           // _signOut(context);
//            await _auth.signOut();
//         },
//         child: Icon(Icons.logout_rounded),
//         backgroundColor: Colors.green,
//       ),

//       body: Center(
//         child: Text("Profile page"),
//       ),
//     );
//   }
// }



//   // final AuthService _auth = new AuthService();
//   @override
//   Widget build(BuildContext context) {
// // return MaterialApp(
// //       title: 'My App',
// //       initialRoute: '/wrapper',
// //       routes: {
// //         // '/login': (context) => Login(),
// //         // '/home': (context) => Home(),
// //         '/wrapper': (context) => Login(),
// //       },
// //     );


// // return MaterialApp(
// //       title: 'My App',
// //       initialRoute: '/',
// //       routes: {
// //         '/': (context) => Login(),
// //         '/profile': (context) => SignOutButton(),
// //       },
// //     );

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Profile'),
//       ),
//       body: Center(
//         child: SignOutButton(),
//       ),
//       );

//   }
// }


// abc@gmail.com
// abc12345