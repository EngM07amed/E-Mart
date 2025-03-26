import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/core/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  var profileImgBytes = Rxn<Uint8List>();

  // TextFields Controllers
  var nameController = TextEditingController();
  var passController = TextEditingController();
  var newpassController = TextEditingController();

  // تغيير الصورة الشخصية
  Future<void> changeImage(BuildContext context) async {
    try {
      final img = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
      );

      if (img != null) {
        final bytes = await img.readAsBytes();
        profileImgBytes.value = bytes;
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  // تحديث بيانات المستخدم
  Future<void> updateUserProfile() async {
    try {
      await FirebaseFirestore.instance
          .collection(userCollection)
          .doc(currentUser!.uid)
          .update({
        'name': nameController.text,
        'password': passController.text,
      });

      Get.snackbar('Success', 'Profile updated successfully',
          backgroundColor: Colors.black, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', 'Failed to update profile',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
