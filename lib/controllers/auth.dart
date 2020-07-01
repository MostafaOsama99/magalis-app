import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:maglis_app/controllers/authMemory.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future login(email, password) async {
    Get.dialog(Center(
      child: CircularProgressIndicator(
        valueColor:
            AlwaysStoppedAnimation<Color>(Color.fromRGBO(170, 44, 94, 1)),
      ),
    ));
    try {
      final FirebaseUser user = (await _auth.signInWithEmailAndPassword(
              email: email, password: password))
          .user;
      user.getIdToken().then((value) async {
        Get.toNamed('/home');
       
        AuthMemory().setPrefs(user.uid);
      });
      print("Success");
      return true;
    } catch (e) {
      Get.back();
      Get.snackbar("Invalid Email or Password", "Please try again...");
      print("Failed");
      return false;
    }
  }
}
