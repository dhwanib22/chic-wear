import 'package:firebase_auth/firebase_auth.dart';
import '../models/loginuser.dart';
import '../models/firebaseuser.dart';
// import '../home_page/Persistent_Bottom_Navigation_Bar.dart';
// import "package:flutter_application/models/firebaseuser.dart";

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   FirebaseUser? _firebaseUser(User? user) {
//     return user != null ? FirebaseUser(uid: user.uid) : null;
//   }

//   // Stream<FirebaseUser?> get user {
//   //   return _auth.authStateChanges().map(_firebaseUser);
//   //   // return FirebaseAuth.instance.authStateChanges();
//   // }
//     Stream<User?> get user{
//     // return _auth.authStateChanges().map(_firebaseUser);
//     return FirebaseAuth.instance.authStateChanges();
//   }

//   Future signInEmailPassword(LoginUser _login) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//               email: _login.email.toString(),
//               password: _login.password.toString());
//       User? user = userCredential.user;
//       return _firebaseUser(user);
//     } on FirebaseAuthException catch (e) {
//       return FirebaseUser(code: e.code, uid: null);
//     }
//   }

//   Future registerEmailPassword(LoginUser _login) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(
//               email: _login.email.toString(),
//               password: _login.password.toString());
//       User? user = userCredential.user;
//       return _firebaseUser(user);
//     } on FirebaseAuthException catch (e) {
//       return FirebaseUser(code: e.code, uid: null);
//     } catch (e) {
//       return FirebaseUser(code: e.toString(), uid: null);
//     }
//   }

//   Future signOut() async {
//     try {
//       return await _auth.signOut();
//     } catch (e) {
//       return null;
//     }
//   }
// }


class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Stream<FirebaseUser?> get user {
  //   return _auth.authStateChanges().map(_firebaseUser);
  //   // return FirebaseAuth.instance.authStateChanges();
  // }
    Stream<User?> get user{
    // return _auth.authStateChanges().map(_firebaseUser);
    return FirebaseAuth.instance.authStateChanges();
  }

  Future<Object> signInEmailPassword(LoginUser _login) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _login.email.toString(),
              password: _login.password.toString());
      User? user = userCredential.user;
      return user!;
    } on FirebaseAuthException catch (e) {
      return FirebaseUser(code: e.code, uid: null);
    }
  }

  Future<Object> registerEmailPassword(LoginUser _login) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: _login.email.toString(),
              password: _login.password.toString());
      User? user = userCredential.user;
      return user!;
    } on FirebaseAuthException catch (e) {
      return FirebaseUser(code: e.code, uid: null);
    } catch (e) {
      return FirebaseUser(code: e.toString(), uid: null);
    }
  }

  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      return null;
    }
  }
}