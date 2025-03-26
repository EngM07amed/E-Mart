import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/widgets/applogo_widgets.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/core/widgets/custom_textfiled.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:emart_app/features/auth/controllers/auth_controller.dart';
import 'package:emart_app/features/home_screen/view/home.dart';
import 'package:emart_app/features/auth_screen/views/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              applogoWidget(),
              const SizedBox(height: 10),
              const Text('Log in to $appname',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
              const SizedBox(height: 10),
              Container(
                width: MediaQuery.of(context).size.width - 70,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 8),
                  ],
                ),
                child: Obx(
                  () => Column(
                    children: [
                      customTextField(
                          title: email,
                          hint: emailHint,
                          isPass: false,
                          controllar: controller.emailController),
                      customTextField(
                          title: password,
                          hint: passwordHint,
                          isPass: true,
                          controllar: controller.passwordController),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: () {}, child: const Text(forgetPass)),
                      ),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: controller.isloading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor))
                            : ourButton(
                                title: login,
                                onpress: () async {
                                  controller.isloading(true);
                                  await controller
                                      .loginMethod(context: context)
                                      .then((value) {
                                    if (value != null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(loggedin)));
                                      Get.offAll(() => const Home());
                                    } else {
                                      controller.isloading(false);
                                    }
                                  });
                                },
                                textcolor: Colors.white,
                                color: redColor,
                              ),
                      ),
                      const SizedBox(height: 10),
                      const Text(createNewAccount,
                          style: TextStyle(color: fontGrey)),
                      const SizedBox(height: 10),
                      SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: ourButton(
                          title: signup,
                          onpress: () => Get.to(() => const SignupScreen()),
                          textcolor: redColor,
                          color: lightGolden,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
