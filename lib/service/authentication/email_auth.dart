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

import 'package:authentication/model/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  String collection = 'UserPost';
  FirebaseFirestore firestore = FirebaseFirestore.instance;

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

  Future<void> googleSignIn() async {
    try {
      // Perform Google Sign-In
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Obtain credential from GoogleSignInAuthentication
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Sign in with Firebase using the obtained credential
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Retrieve user information
      final User? guser = userCredential.user;

      // Create an AuthenticationModel instance
      final authenticationModel = AuthenticationModel(
        email: guser?.email,
        name: guser?.displayName,
        phoneNumber: guser?.phoneNumber,
        uId: guser?.uid,
      );

      // Store user data in Firestore
      await firestore.collection(collection).doc(guser?.uid).set(
            authenticationModel.toJson(),
          );
    } catch (e) {
      print('Google Sign-In Error: $e'); // Log any errors during sign-in
      throw e; // Rethrow the error for handling in UI if necessary
    }
  }
}
