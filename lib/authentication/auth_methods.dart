// ignore_for_file: use_build_context_synchronously

// import 'dart:html';
// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zed_stores/core/utils/showOTPdialog.dart';
import 'package:zed_stores/core/utils/snackbar.dart';
import 'package:zed_stores/pages/app_screen.dart';
import 'package:zed_stores/pages/login_screen.dart';

class FireBaseAuthMethods {
  final FirebaseAuth _auth;
  FireBaseAuthMethods(this._auth);

  // SIGNUP WITH EMAIL
  Future<void> signUpWithEmail(
      {required String name,
      required String email,
      required String password,
      required BuildContext context}) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Access the new user's UID from the UserCredential
      String uid = userCredential.user!.uid;

      // Add user details to the 'users' collection with the UID as the document ID
      await FirebaseFirestore.instance.collection('users').doc(uid).set({
        'name': name,
        'email': email,
      });

      await userCredential.user!.updateDisplayName(name);

      await sendEmailVerification(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  // LOGIN WITH EMAIL
  Future<void> loginWithEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      // Check if the user exists
      // var methods = await _auth.fetchSignInMethodsForEmail(email);

      // QuerySnapshot query = await FirebaseFirestore.instance
      //     .collection('users')
      //     .where("e-mail", isEqualTo: email)
      //     .get();

      // print(query.docs);

      // if (query.docs.isNotEmpty) {
      //   var user = query.docs.first;
      //   print(user);
      //   if (user['e-mail'] == email) {
      //     var userCredential = await _auth.signInWithEmailAndPassword(
      //       email: email,
      //       password: password,
      //     );

      //     if (userCredential.user != null) {
      //       if (!userCredential.user!.emailVerified) {
      //         showSnackbar(context, 'Please verify your email');
      //         await sendEmailVerification(context);
      //       } else {
      //         showSnackbar(context, 'Successfully logged in');
      //         Navigator.push(
      //           context,
      //           MaterialPageRoute(
      //             builder: (context) => const MyHomePage(
      //               title: 'Zed Stores',
      //             ),
      //           ),
      //         );
      //       }
      //     }
      //   }
      // } else {
      //   showSnackbar(
      //       context, 'User does not exist. Please check your credentials.');
      // }

      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (!_auth.currentUser!.emailVerified) {
        showSnackbar(context, 'please verify your email');
        await sendEmailVerification(context);
      } else {
        showSnackbar(context, 'Successfully logged in');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const MyHomePage(
              title: 'Zed Stores',
            ),
          ),
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showSnackbar(
            context, 'User does not exist. Please check your credentials.');
      } else {
        showSnackbar(context, e.message!);
      }
    }
  }

  // SEND EMAIL VERIFICATION
  Future<void> sendEmailVerification(context) async {
    try {
      _auth.currentUser!.sendEmailVerification();
      showSnackbar(context, 'Email verification sent');
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  // PHONE SIGN IN
  Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    TextEditingController codeController = TextEditingController();
    if (kIsWeb) {
      ConfirmationResult result =
          await _auth.signInWithPhoneNumber(phoneNumber);
      showOTPDialog(
        context: context,
        codeController: codeController,
        onPressed: () async {
          PhoneAuthCredential phoneAuthCredential =
              PhoneAuthProvider.credential(
            verificationId: result.verificationId,
            smsCode: codeController.text.trim(),
          );
          await _auth.signInWithCredential(phoneAuthCredential);
          Navigator.of(context).pop();
        },
      );
    } else {
      await _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (phoneAuthCredential) async {
          await _auth.signInWithCredential(phoneAuthCredential);
          showSnackbar(context, 'verification completed');
        },
        verificationFailed: (e) {
          showSnackbar(context, e.message!);
        },
        codeSent: (verificationId, forceResendingToken) {
          showOTPDialog(
            context: context,
            codeController: codeController,
            onPressed: () async {
              PhoneAuthCredential phoneAuthCredential =
                  PhoneAuthProvider.credential(
                verificationId: verificationId,
                smsCode: codeController.text.trim(),
              );
              await _auth.signInWithCredential(phoneAuthCredential);
              Navigator.of(context).pop();
            },
          );
        },
        codeAutoRetrievalTimeout: (verificationId) {
          // Auto resolution timeout
        },
      );
    }
  }

  // GOOGLE SIGNIN
  // Future<void> signInWithGoogle(BuildContext context) async {
  //   try {
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //     final GoogleSignInAuthentication? googleAuth =
  //         await googleUser?.authentication;
  //     // print(googleAuth?.accessToken);
  //     print(googleAuth?.idToken);
  //     if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
  //       print(googleUser);
  //       final credential = GoogleAuthProvider.credential(
  //           idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

  //       UserCredential userCredential =
  //           await _auth.signInWithCredential(credential);
  //       showSnackbar(context, 'signed in');
  //       print(userCredential.user?.displayName);
  //       Navigator.push(
  //           context,
  //           MaterialPageRoute(
  //               builder: (context) => const MyHomePage(
  //                     title: 'Zed Stores',
  //                   )));
  //       // GoogleSignIn().signOut();
  //       // if (userCredential.user != null) {
  //       //   // checks if the user is already signed up
  //       //   if (userCredential.additionalUserInfo!.isNewUser) {}
  //       // }
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     showSnackbar(context, e.message!);
  //   }
  // }

  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
            idToken: googleAuth?.idToken, accessToken: googleAuth?.accessToken);

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);

        // Access user details from userCredential.user
        final User? user = userCredential.user;

        if (user != null) {
          // Check if the user already exists in Firestore
          final userSnapshot = await FirebaseFirestore.instance
              .collection('users')
              .doc(user.uid)
              .get();

          if (!userSnapshot.exists) {
            // If the user doesn't exist, add them to Firestore
            await addUserToFirestore(user);
          }

          showSnackbar(context, 'Signed in');
          print(user.displayName);

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MyHomePage(
                title: 'Zed Stores',
              ),
            ),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      showSnackbar(context, e.message!);
    }
  }

  Future<void> addUserToFirestore(User user) async {
    final CollectionReference usersCollection =
        FirebaseFirestore.instance.collection('users');

    // Add the user to Firestore
    await usersCollection.doc(user.uid).set({
      'name': user.displayName,
      'displayName': user.displayName,
      'email': user.email,
      // Add other user details as needed
    });
  }

  void signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      print("User signed out");
    } catch (e) {
      print("Error signing out: $e");
    }
  }
}
// keytool -list -v -keystore ~/.android/debug.keystore -alias androiddebugkey -storepass android -keypass android 
