import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../HomeScreen/Components/home_screen.dart';
import 'login.dart';

class AuthController extends GetxController {
  final FirebaseAuth auth = FirebaseAuth.instance;

  RxBool showWidget = false.obs;
  void signUp(signUpEmailController, signUpPasswordController, name,
      Widget nextScreen) async {
    try {
      final UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(
        email: signUpEmailController.text.toString(),
        password: signUpPasswordController.text.toString(),
      );
      if (userCredential.user != null) {
        final String userUid = userCredential.user!.uid;
        final databaseRef =
            FirebaseDatabase.instance.ref().child('users').child(userUid);
        await databaseRef.set({
          'Name': name,
        });
      }
      showWidget.toggle();
      await Future.delayed(const Duration(seconds: 2));
      Get.to(LoginScreen(),
          duration: const Duration(milliseconds: 1200),
          transition: Transition.fadeIn);
    } catch (error) {
      if (kDebugMode) {
        print(error.toString());
      }
    }
  }

  void login(String email, String password) {
    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
          final User? user=FirebaseAuth.instance.currentUser;
          if (kDebugMode) {
            print(user?.uid.toString());
          }
      Get.to(HomeScreen(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 700));
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
    });
  }

  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Once signed in, return the UserCredential
    return await auth.signInWithCredential(credential);
  }
}
