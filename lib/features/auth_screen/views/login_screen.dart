import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/list.dart';
import 'package:emart_app/core/widgets/applogo_widgets.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/core/widgets/custom_textfiled.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:emart_app/features/auth_screen/views/signup_screen.dart';
import 'package:emart_app/features/home_screen/view/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            applogoWidget(),
            const SizedBox(height: 10),
            const Text(
              'Log in to $appname',
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
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
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(
                children: [
                  customTextField(title: email, hint: emailHint),
                  customTextField(title: password, hint: passwordHint),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        forgetPass,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ourButton(
                        title: login,
                        onpress: () {
                          Get.to(() => const Home());
                        },
                        textcolor: Colors.white,
                        color: redColor,
                      )),
                  const SizedBox(height: 10),
                  const Text(
                    createNewAccount,
                    style: TextStyle(color: fontGrey),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ourButton(
                        title: signup,
                        onpress: () {
                          Get.to(() => const SignupScreen());
                        },
                        textcolor: redColor,
                        color: lightGolden,
                      )),
                  const SizedBox(height: 10),
                  const Text(
                    loginWith,
                    style: TextStyle(color: fontGrey),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(socialIconList[index],
                                    width: 30),
                              ),
                            )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
