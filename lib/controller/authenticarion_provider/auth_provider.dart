import 'package:authentication/service/authentication/email_google_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthenticationProvider extends ChangeNotifier {
  final EmailGoogleAuth emailAuthService = EmailGoogleAuth();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<UserCredential> signUpEmail(String email, String password) async {
    return await emailAuthService.signUpEmail(email, password);
  }

  Future<UserCredential> signInEmail(String email, String password) async {
    return await emailAuthService.signInEmail(email, password);
  }

  Future<void> signOutEmail() async {
    return await emailAuthService.signOutEmail();
  }

  Future<void> googleSignIn() async {
    await emailAuthService.googleSignIn();
    notifyListeners();
  }

  gitHubSignIn(BuildContext context) async {
    try {
      await emailAuthService.gitHubSign(context);
    } catch (e) {
      throw Exception('Exception $e');
    }
    notifyListeners();
  }

  clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    notifyListeners();
  }
}
