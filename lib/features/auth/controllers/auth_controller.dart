import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/core/consts/firebase_consts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AuthController extends GetxController {
  var isloading = false.obs;

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  Future<UserCredential?> loginMethod({required BuildContext context}) async {
    try {
      return await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  Future<UserCredential?> signUpMethod(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      return await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
      return null;
    }
  }

  storeUserData(
      {required String name,
      required String email,
      required String password}) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .set({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      context?.push(SnackBar(content: Text(e.toString())));
    }
  }
}
