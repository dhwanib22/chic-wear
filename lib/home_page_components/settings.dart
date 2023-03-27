import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


// version 1 - working without 
// class SettingsScreen extends StatefulWidget {
//   // final void Function(Meeting?) onAppointmentSelected;

//   // const MyCalendar1({Key? key, required this.onAppointmentSelected}) : super(key: key);
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   SettingsScreenState createState() => SettingsScreenState();
// }

// class SettingsScreenState extends State<SettingsScreen> {
//   // SettingsScreenState({Key? key}) : super(key: key);
//   late SettingsScreen _ancestorWidget;
//   final TextEditingController _emailController = TextEditingController();
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final state = context.findAncestorStateOfType<SettingsScreenState>();
//   }

//   @override
//   void dispose() {
//     // access _ancestorWidget safely here
//     super.dispose();
//   }

//   Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       Navigator.popUntil(context, ModalRoute.withName('/'));
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _changePassword(BuildContext context) async {
//     final email = _emailController.text;
//     if (email.isNotEmpty) {
//       try {
//         await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Success!'),
//             content: Text('Please check your email to reset your password.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       } catch (e) {
//         print(e);
//         showDialog(
//           context: _getDialogContext(context), // use nearest ancestor context

//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to reset password. Please try again later.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       }
//     }
//   }

//   Future<void> _updatePassword(BuildContext context, String newPassword) async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       try {
//         await currentUser.updatePassword(newPassword);
//         await FirebaseAuth.instance
//             .signOut(); // sign out after updating the password
//         showDialog(
//           context: _getDialogContext(context), // use nearest ancestor context
//           builder: (context) => AlertDialog(
//             title: Text('Success!'),
//             content:
//                 Text('Your password has been updated. Please log in again.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       } catch (e) {
//         print(e);
//         showDialog(
//           context: _getDialogContext(context), // use nearest ancestor context
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to update password. Please try again later.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       }
//     }
//   }

//   BuildContext _getDialogContext(BuildContext context) {
//     // find nearest SettingsScreenState object
//     final state = context.findAncestorStateOfType<SettingsScreenState>();
//     // return context of SettingsScreenState object
//     return state?.context ?? context;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Settings'),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Color.fromARGB(255, 171, 110, 88),
//         ),
//         body: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Account',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Color.fromARGB(255, 171, 110, 88),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text('Edit Profile'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.email),
//                       title: Text('Change Email'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.lock),
//                       title: Text('Change Password'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: Text('Change Password'),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     labelText: 'New Password',
//                                   ),
//                                   obscureText: true,
//                                   onChanged: (value) {},
//                                 ),
//                                 SizedBox(height: 16.0),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     labelText: 'Confirm Password',
//                                   ),
//                                   obscureText: true,
//                                   onChanged: (value) {},
//                                 ),
//                               ],
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('CANCEL'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   final newPassword = '';
//                                   _updatePassword(context, newPassword);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('SAVE'),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Preferences',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Color.fromARGB(255, 171, 110, 88),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     ListTile(
//                       leading: Icon(Icons.notifications),
//                       title: Text('Notifications'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Support',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Color.fromARGB(255, 171, 110, 88),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     ListTile(
//                       leading: Icon(Icons.help),
//                       title: Text('Help Center'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.logout),
//                       title: Text('Sign Out'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {
//                         _signOut(context);
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//             ])));
//   }
// }




// version 2 - update working
// class SettingsScreenState extends State<SettingsScreen> {
//   late SettingsScreen _ancestorWidget;
//   final TextEditingController _emailController = TextEditingController();
//   String _newPassword = '';

//   @override
//   void dispose() {
//     _emailController.dispose();
//     super.dispose();
//   }

//   Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       Navigator.popUntil(context, ModalRoute.withName('/'));
//     } catch (e) {
//       print(e);
//     }
//   }

//   Future<void> _changePassword(BuildContext context) async {
//     final email = _emailController.text;
//     if (email.isNotEmpty) {
//       try {
//         await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//         showDialog(
//           context: context,
//           builder: (context) => AlertDialog(
//             title: Text('Success!'),
//             content: Text('Please check your email to reset your password.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       } catch (e) {
//         print(e);
//         showDialog(
//           context: _getDialogContext(context),
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to reset password. Please try again later.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       }
//     }
//   }

//   Future<void> _updatePassword(BuildContext context) async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       try {
//         await currentUser.updatePassword(_newPassword);
//         await _signOut(context);
//         showDialog(
//           context: _getDialogContext(context),
//           builder: (context) => AlertDialog(
//             title: Text('Success!'),
//             content:
//                 Text('Your password has been updated. Please log in again.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       } catch (e) {
//         print(e);
//         showDialog(
//           context: _getDialogContext(context),
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to update password. Please try again later.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       }
//     }
//   }

//   BuildContext _getDialogContext(BuildContext context) {
//     final state = context.findAncestorStateOfType<SettingsScreenState>();
//     return state?.context ?? context;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Settings'),
//         centerTitle: false,
// ),
// body: SingleChildScrollView(
// padding: const EdgeInsets.all(16.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.stretch,
// children: [
// Text(
// 'Account',
// style: Theme.of(context).textTheme.headline6,
// ),
// SizedBox(height: 16.0),
// TextField(
// controller: _emailController,
// decoration: InputDecoration(
// labelText: 'Email',
// hintText: 'Enter your email',
// border: OutlineInputBorder(),
// ),
// ),
// SizedBox(height: 16.0),
// ElevatedButton(
// onPressed: () {
// _changePassword(context);
// },
// child: Text('Reset Password'),
// ),
// SizedBox(height: 32.0),
// Text(
// 'Change Password',
// style: Theme.of(context).textTheme.headline6,
// ),
// SizedBox(height: 16.0),
// TextField(
// obscureText: true,
// onChanged: (value) {
// _newPassword = value;
// },
// decoration: InputDecoration(
// labelText: 'New Password',
// hintText: 'Enter your new password',
// border: OutlineInputBorder(),
// ),
// ),
// SizedBox(height: 16.0),
// ElevatedButton(
// onPressed: () {
// _updatePassword(context);
// },
// child: Text('Update Password'),
// ),
// SizedBox(height: 32.0),
// TextButton(
// onPressed: () {
// _signOut(context);
// },
// child: Text('Sign Out'),
// ),
// ],
// ),
// ),
// );
// }
// }

// class SettingsScreen extends StatefulWidget {
// @override
// State<StatefulWidget> createState() {
// return SettingsScreenState();
// }
// }







// version 3
// class SettingsScreen extends StatefulWidget {
//   // final void Function(Meeting?) onAppointmentSelected;

//   // const MyCalendar1({Key? key, required this.onAppointmentSelected}) : super(key: key);
//   const SettingsScreen({Key? key}) : super(key: key);

//   @override
//   SettingsScreenState createState() => SettingsScreenState();
// }

// class SettingsScreenState extends State<SettingsScreen> {
//   // SettingsScreenState({Key? key}) : super(key: key);
//   late SettingsScreen _ancestorWidget;
//   final TextEditingController _emailController = TextEditingController();
//   String _newPassword = '';

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     final state = context.findAncestorStateOfType<SettingsScreenState>();
//   }

//   @override
//   void dispose() {
//     // access _ancestorWidget safely here
//     super.dispose();
//   }

//   Future<void> _signOut(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       Navigator.popUntil(context, ModalRoute.withName('/'));
//     } catch (e) {
//       print(e);
//     }
//   }

//   //  Future<void> _changeEmail(BuildContext context) async {
//   //   final email = _emailController.text;
//   //   if (email.isNotEmpty) {
//   //     try {
//   //       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//   //       showDialog(
//   //         context: context,
//   //         builder: (context) => AlertDialog(
//   //           title: Text('Success!'),
//   //           content: Text('Please check your email to reset your password.'),
//   //           actions: [
//   //             TextButton(
//   //               onPressed: () {
//   //                 Navigator.pop(context);
//   //               },
//   //               child: Text('OK'),
//   //             )
//   //           ],
//   //         ),
//   //       );
//   //     } catch (e) {
//   //       print(e);
//   //       showDialog(
//   //         context: _getDialogContext(context),
//   //         builder: (context) => AlertDialog(
//   //           title: Text('Error'),
//   //           content: Text('Failed to reset password. Please try again later.'),
//   //           actions: [
//   //             TextButton(
//   //               onPressed: () {
//   //                 Navigator.pop(context);
//   //               },
//   //               child: Text('OK'),
//   //             )
//   //           ],
//   //         ),
//   //       );
//   //     }
//   //   }
//   // }

//   Future<void> _updatePassword(BuildContext context) async {
//     final currentUser = FirebaseAuth.instance.currentUser;
//     if (currentUser != null) {
//       try {
//         await currentUser.updatePassword(_newPassword);
//         await _signOut(context);
//         showDialog(
//           context: _getDialogContext(context),
//           builder: (context) => AlertDialog(
//             title: Text('Success!'),
//             content:
//                 Text('Your password has been updated. Please log in again.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       } catch (e) {
//         print(e);
//         showDialog(
//           context: _getDialogContext(context),
//           builder: (context) => AlertDialog(
//             title: Text('Error'),
//             content: Text('Failed to update password. Please try again later.'),
//             actions: [
//               TextButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 child: Text('OK'),
//               )
//             ],
//           ),
//         );
//       }
//     }
//   }

//   BuildContext _getDialogContext(BuildContext context) {
//     final state = context.findAncestorStateOfType<SettingsScreenState>();
//     return state?.context ?? context;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Settings'),
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Color.fromARGB(255, 171, 110, 88),
//         ),
//         body: SingleChildScrollView(
//             padding: EdgeInsets.symmetric(vertical: 16.0),
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Account',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Color.fromARGB(255, 171, 110, 88),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     ListTile(
//                       leading: Icon(Icons.person),
//                       title: Text('Edit Profile'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.email),
//                       title: Text('Change Email'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.lock),
//                       title: Text('Change Password'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {
//                         showDialog(
//                           context: context,
//                           builder: (context) => AlertDialog(
//                             title: Text('Change Password'),
//                             content: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     labelText: 'New Password',
//                                   ),
//                                   obscureText: true,
//                                   onChanged: (value) {},
//                                 ),
//                                 SizedBox(height: 16.0),
//                                 TextFormField(
//                                   decoration: InputDecoration(
//                                     labelText: 'Confirm Password',
//                                   ),
//                                   obscureText: true,
//                                   onChanged: (value) {_newPassword = value;},
//                                 ),
//                               ],
//                             ),
//                             actions: [
//                               TextButton(
//                                 onPressed: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('CANCEL'),
//                               ),
//                               TextButton(
//                                 onPressed: () {
//                                   // final newPassword = '';
//                                   _updatePassword(context);
//                                   Navigator.pop(context);
//                                 },
//                                 child: Text('SAVE'),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Preferences',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Color.fromARGB(255, 171, 110, 88),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     ListTile(
//                       leading: Icon(Icons.notifications),
//                       title: Text('Notifications'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//               SizedBox(height: 16.0),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       'Support',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20.0,
//                         color: Color.fromARGB(255, 171, 110, 88),
//                       ),
//                     ),
//                     SizedBox(height: 16.0),
//                     ListTile(
//                       leading: Icon(Icons.help),
//                       title: Text('Help Center'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {},
//                     ),
//                     Divider(),
//                     ListTile(
//                       leading: Icon(Icons.logout),
//                       title: Text('Sign Out'),
//                       trailing: Icon(Icons.arrow_forward_ios),
//                       onTap: () {
//                         _signOut(context);
//                       },
//                     ),
//                     Divider(),
//                   ],
//                 ),
//               ),
//             ])));
//   }
// }






import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home_page_components/about_us.dart';

class SettingsScreen extends StatefulWidget {
  // final void Function(Meeting?) onAppointmentSelected;

  // const MyCalendar1({Key? key, required this.onAppointmentSelected}) : super(key: key);
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  SettingsScreenState createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  // SettingsScreenState({Key? key}) : super(key: key);
  late SettingsScreen _ancestorWidget;
  final TextEditingController _emailController = TextEditingController();
  String _newPassword = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final state = context.findAncestorStateOfType<SettingsScreenState>();
  }

  @override
  void dispose() {
    // access _ancestorWidget safely here
    super.dispose();
  }

  Future<void> _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      Navigator.popUntil(context, ModalRoute.withName('/'));
    } catch (e) {
      print(e);
    }
  }

  //  Future<void> _changeEmail(BuildContext context) async {
  //   final email = _emailController.text;
  //   if (email.isNotEmpty) {
  //     try {
  //       await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
  //       showDialog(
  //         context: context,
  //         builder: (context) => AlertDialog(
  //           title: Text('Success!'),
  //           content: Text('Please check your email to reset your password.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text('OK'),
  //             )
  //           ],
  //         ),
  //       );
  //     } catch (e) {
  //       print(e);
  //       showDialog(
  //         context: _getDialogContext(context),
  //         builder: (context) => AlertDialog(
  //           title: Text('Error'),
  //           content: Text('Failed to reset password. Please try again later.'),
  //           actions: [
  //             TextButton(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text('OK'),
  //             )
  //           ],
  //         ),
  //       );
  //     }
  //   }
  // }

  Future<void> _updatePassword(BuildContext context) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      try {
        await currentUser.updatePassword(_newPassword);
        await _signOut(context);
        showDialog(
          context: _getDialogContext(context),
          builder: (context) => AlertDialog(
            title: Text('Success!'),
            content:
                Text('Your password has been updated. Please log in again.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              )
            ],
          ),
        );
      } catch (e) {
        print(e);
        showDialog(
          context: _getDialogContext(context),
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to update password. Please try again later.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              )
            ],
          ),
        );
      }
    }
  }

  BuildContext _getDialogContext(BuildContext context) {
    final state = context.findAncestorStateOfType<SettingsScreenState>();
    return state?.context ?? context;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Settings',
              textAlign: TextAlign.left,
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
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Account',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 171, 110, 88),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Edit Profile'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('Change Email'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.lock),
                      title: Text('Change Password'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: Text('Change Password'),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'New Password',
                                  ),
                                  obscureText: true,
                                  onChanged: (value) {},
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Confirm Password',
                                  ),
                                  obscureText: true,
                                  onChanged: (value) {
                                    _newPassword = value;
                                  },
                                ),
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('CANCEL'),
                              ),
                              TextButton(
                                onPressed: () {
                                  // final newPassword = '';
                                  _updatePassword(context);
                                  Navigator.pop(context);
                                },
                                child: Text('SAVE'),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Divider(),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferences',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 171, 110, 88),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      leading: Icon(Icons.notifications),
                      title: Text('Notifications'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {},
                    ),
                    Divider(),
                  ],
                ),
              ),
              SizedBox(height: 16.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Support',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Color.fromARGB(255, 171, 110, 88),
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ListTile(
                      leading: Icon(Icons.help),
                      title: Text('About Us'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AboutUsPage()),
                        );
                      },
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.logout),
                      title: Text('Sign Out'),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _signOut(context);
                      },
                    ),
                    Divider(),
                  ],
                ),
              ),
            ])));
  }
}