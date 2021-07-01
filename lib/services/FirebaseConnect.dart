import 'dart:developer';

import 'package:ecommerceproject/services/AppConnectServ.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirebaseService extends AppConnectServ {
  // FirebaseAuth auth = FirebaseAuth.instance;
  static var firebaseAuthinstance = FirebaseAuth.instance;

  /////////// Initialize Firebase //////////////////////
  static Future<void> initializeFlutterFire() async {
    bool _initialized = false;
    bool _error = false;

    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();

      _initialized = true;
      log("Init Firebase State :$_initialized");
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails

      _error = true;
      print(_error);
    }
  }

  ///
  ///
  ///
//////////////chechUser////////////////////////////

  static void chechUser() {
    firebaseAuthinstance.authStateChanges().listen((User user) {
      //User?
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
  }

  ///
  ///
  ///
//////////////getCurrentUser////////////////////////////
  static Future<void> getUserUID() async {
    try {
      if (firebaseAuthinstance.currentUser != null) {
        print(firebaseAuthinstance.currentUser.uid);
      }
    } on FirebaseAuthException catch (e) {
      print('$e   301');
    } catch (e) {
      print(e);
    }
  }

  ///
  ///
//////////////signInWithEmailAndPassword////////////////////////////
  static Future<void> signInWithEmailAndPassword(
      {String emailText, String passwordText}) async {
    try {
      await firebaseAuthinstance.signInWithEmailAndPassword(
          email: "$emailText", password: "$passwordText");
    } on FirebaseAuthException catch (error) {
      if (error.code == 'user-not-found') {
        print('No user found for that email.');

        throw error;
      } else if (error.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        throw error;
      }
    }
  }

  ///
  ///
  ///
  ///
//////////////registrationUserEmail////////////////////////////

  static Future<void> registrationUserEmail(
      {@required String emailText, @required String passwordText}) async {
    try {
      UserCredential _userCredential =
          await firebaseAuthinstance.createUserWithEmailAndPassword(
              email: emailText, password: passwordText);
      print(_userCredential.toString());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }
}
