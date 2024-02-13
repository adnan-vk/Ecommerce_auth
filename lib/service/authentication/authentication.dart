import 'dart:developer';
import 'package:authentication/model/auth_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class EmailGoogleAuth {
  String? _verificationid;
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
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      final User? guser = userCredential.user;
      final authenticationModel = AuthenticationModel(
        email: guser?.email,
        name: guser?.displayName,
        phoneNumber: guser?.phoneNumber,
        uId: guser?.uid,
      );
      await firestore.collection(collection).doc(guser?.uid).set(
            authenticationModel.toJson(),
          );
    } catch (e) {
      log('Google Sign-In Error: $e');
      rethrow;
    }
  }

  gitHubSign(context) async {
    GithubAuthProvider githubAuthProvider = GithubAuthProvider();
    try {
      UserCredential user =
          await firebaseAuth.signInWithProvider(githubAuthProvider);
      User gituser = user.user!;
      final AuthenticationModel userdata = AuthenticationModel(
          email: gituser.email, name: gituser.displayName, uId: gituser.uid);
      firestore.collection("users").doc(gituser.uid).set(userdata.toJson());
      return user;
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<void> getOtp(String phoneNumber) async {
    try {
      await firebaseAuth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) async {
            await firebaseAuth.signInWithCredential(phoneAuthCredential);
          },
          verificationFailed: (error) {
            log("verification failed error : $error");
          },
          codeSent: (verificationId, forceResendingToken) {
            _verificationid = verificationId;
          },
          codeAutoRetrievalTimeout: (verificationId) {
            _verificationid = verificationId;
          },
          timeout: Duration(seconds: 60));
    } catch (e) {
      log("sign in error : $e");
    }
  }

  Future<void> verifyOtp(String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: _verificationid!, smsCode: otp);
    } catch (e) {
      log("verify otp error $e");
    }
  }
}
