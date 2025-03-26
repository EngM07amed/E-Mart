import 'dart:io';
import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/images.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/core/widgets/custom_textfiled.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:emart_app/features/profile_screen/view/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key, this.data});
  final dynamic data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    controller.nameController.text = data['name'];
    controller.passController.text = data['password'];

    return bgWidget(
      Scaffold(
        appBar: AppBar(),
        body: Obx(
          () => Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 50, left: 12, right: 12),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: controller.profileImgBytes.value == null
                        ? Image.asset(
                            imgProfile2,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          )
                        : Image.memory(
                            controller.profileImgBytes.value!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                const SizedBox(height: 10),
                ourButton(
                  color: redColor,
                  onpress: () => controller.changeImage(context),
                  textcolor: whiteColor,
                  title: 'Change',
                ),
                const Divider(),
                const SizedBox(height: 20),
                customTextField(
                    controllar: controller.nameController,
                    hint: nameHint,
                    title: name,
                    isPass: false),
                customTextField(
                    controllar: controller.passController,
                    hint: passwordHint,
                    title: 'old password',
                    isPass: true),
                const SizedBox(height: 10),
                customTextField(
                    controllar: controller.passController,
                    hint: passwordHint,
                    title: 'new password',
                    isPass: true),
                const SizedBox(height: 20),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 60,
                  child: ourButton(
                    color: redColor,
                    onpress: () => controller.updateUserProfile(),
                    textcolor: whiteColor,
                    title: 'Save',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
