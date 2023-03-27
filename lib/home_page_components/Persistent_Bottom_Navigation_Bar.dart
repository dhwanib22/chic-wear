import 'package:flutter/material.dart';
// import 'package:flutter_application_1/home_page_components/carousel.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:flutter/cupertino.dart';
import 'home_screen.dart';
import 'package:flutter_application_1/Camera/camera_screen.dart';
import 'package:flutter_application_1/Profile_Page/profile_main.dart';
import "package:flutter_application_1/search_page/search.dart";
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



// useremailid: abc@gmail.com
// password: abc12345
