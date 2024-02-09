// import 'dart:developer';

// import 'package:firebase_auth/firebase_auth.dart';

// // class EmailAuth {
// //   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

// //   Future signUpEmail(String email, String password) async {
// //     try {
// //       UserCredential usercredential = await firebaseAuth
// //           .createUserWithEmailAndPassword(email: email, password: password);
// //       log('account created');
// //       return usercredential.user;
// //     } catch (e) {
// //       rethrow;
// //     }
// //   }
// class EmailAuth {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//   Future<User?> signUpEmail(String email, String password) async {
//     try {
//       UserCredential userCredential = await firebaseAuth
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return userCredential.user;
//     } catch (e) {
//       print('Error signing up: $e');
//       return null;
//     }
//   }
// }

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

class EmailAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<UserCredential> signUpEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      log('Account created');
      return userCredential;
    } catch (e) {
      rethrow;
    }
  }

  Future<UserCredential> signInEmail(String email, String password) async {
    try {
      UserCredential userCredential = await firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      log('User loged in');
      return userCredential;
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }

  Future<void> signOutEmail() async {
    await firebaseAuth.signOut();
  }
}
