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

  Future<void> storeUserData(
      {required String name,
      required String email,
      required String password}) async {
    try {
      await firestore
          .collection(userCollection)
          .doc(auth.currentUser!.uid)
          .set({
        'name': name,
        'email': email,
        'password': password,
        'imageUrl': '',
        'id': auth.currentUser!.uid,
        'cart_count': '00',
        'wishlist_count': '00',
        'order_count': '00',
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  signoutMethod(context) async {
    try {
      await auth.signOut();
    } catch (e) {
      context?.push(SnackBar(content: Text(e.toString())));
    }
  }
}
