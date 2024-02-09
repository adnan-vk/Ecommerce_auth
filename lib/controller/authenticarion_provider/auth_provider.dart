// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:project/service/authentication/email_auth.dart';

// // class EmailProvider extends ChangeNotifier{
// //   final EmailAuth emailauth = EmailAuth();

// //   User? user;

// //   Future signUpWithEmail(String email , String password)async{
// //     user = await emailauth.signUpEmail(email, password);
// //     notifyListeners();
// //   }
// // }
// class EmailProvider extends ChangeNotifier {
//   final EmailAuth emailAuth = EmailAuth();

//   User? user;

//   Future signUpWithEmail(String email, String password) async {
//     user = await emailAuth.signUpEmail(email, password);
//     notifyListeners();
//   }
// }

import 'package:authentication/service/authentication/email_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProviderEmail extends ChangeNotifier {
  final EmailAuth emailAuthService = EmailAuth();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  bool showLoginPage = true;

  Future<UserCredential> signUpEmail(String email, String password) async {
    return await emailAuthService.signUpEmail(email, password);
  }

  Future<UserCredential> signInEmail(String email, String password) async {
    return await emailAuthService.signInEmail(email, password);
  }

  Future<void> signOutWithEmail() async {
    return await emailAuthService.signOutEmail();
  }

  void togglepages() {
    showLoginPage = !showLoginPage;
    notifyListeners();
  }

  clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
  }
}
