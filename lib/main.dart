import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page_components/Persistent_Bottom_Navigation_Bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/wrapper.dart';
import 'package:firebase_auth/firebase_auth.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
  // runApp(MaterialApp(
  //   title: 'My App',
  //   home: IntroScreen(),
  //   debugShowCheckedModeBanner: false
  // ));
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: Colors.black,
          buttonTheme: ButtonThemeData(
            buttonColor: Colors.black,
            textTheme: ButtonTextTheme.primary,
            colorScheme:
                Theme.of(context).colorScheme.copyWith(secondary: Colors.white),
          ),
          fontFamily: 'Georgia',
          textTheme: const TextTheme(
            headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
            headline6: TextStyle(fontSize: 20.0, fontStyle: FontStyle.italic),
            bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
          ),
        ),
        home: Scaffold(
            body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return navb();
            } else {
              return Wrapper();
            }
          },
        )));
  }
}
    
