import 'package:flutter_application_1/home_page_components/home_screen.dart';
import 'package:provider/provider.dart';
import '../pages/sign_out.dart';
import 'package:flutter/material.dart';

import '../models/firebaseuser.dart';
// import "package:flutter_application/models/firebaseuser.dart";
import '../screens/handler.dart';
// import '../pages/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser?>(context);

    if (user == null) {
      return Handler();
    } 
    else {
      return HomePage();
    }
  }
}
