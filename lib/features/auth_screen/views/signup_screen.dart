import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/widgets/applogo_widgets.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/core/widgets/custom_textfiled.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:emart_app/features/auth/controllers/auth_controller.dart';
import 'package:emart_app/features/home_screen/view/home.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isCheck = false;
  var controller = Get.put(AuthController());

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              applogoWidget(),
              const SizedBox(height: 10),
              const Text('Join the $appname',
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
                child: Column(
                  children: [
                    customTextField(
                        title: name,
                        hint: nameHint,
                        controllar: nameController,
                        isPass: false),
                    customTextField(
                        title: email,
                        hint: emailHint,
                        controllar: emailController,
                        isPass: false),
                    customTextField(
                        title: password,
                        hint: passwordHint,
                        controllar: passwordController,
                        isPass: true),
                    customTextField(
                        title: retypePassword,
                        hint: passwordHint,
                        controllar: passwordRetypeController,
                        isPass: true),
                    const SizedBox(height: 10),

                    // ✅ Checkbox Terms & Conditions
                    Row(
                      children: [
                        Checkbox(
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue!;
                            });
                          },
                        ),
                        const Expanded(
                          child: Text(
                            "I agree to the Terms and Conditions",
                            style: TextStyle(fontSize: 12, color: fontGrey),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // ✅ زر التسجيل
                    Obx(
                      () => SizedBox(
                        width: MediaQuery.of(context).size.width - 50,
                        child: controller.isloading.value
                            ? const CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation(redColor))
                            : ourButton(
                                title: signup,
                                onpress: () async {
                                  if (isCheck) {
                                    if (passwordController.text ==
                                        passwordRetypeController.text) {
                                      controller.isloading(true);
                                      await controller
                                          .signUpMethod(
                                              email: emailController.text,
                                              password: passwordController.text,
                                              context: context)
                                          .then((value) {
                                        if (value != null) {
                                          controller.storeUserData(
                                            email: emailController.text,
                                            password: passwordController.text,
                                            name: nameController.text,
                                          );
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  content: Text(loggedin)));
                                          Get.offAll(() => const Home());
                                        } else {
                                          controller.isloading(false);
                                        }
                                      });
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  "Passwords do not match")));
                                    }
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content: Text(
                                                "Please accept the terms & conditions")));
                                  }
                                },
                                textcolor: Colors.white,
                                color: isCheck ? redColor : lightGrey,
                              ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
