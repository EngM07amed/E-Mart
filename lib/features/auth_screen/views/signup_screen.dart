import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/widgets/applogo_widgets.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/core/widgets/custom_textfiled.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
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
              'Jion the $appname',
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
                  customTextField(title: name, hint: nameHint),
                  customTextField(title: email, hint: emailHint),
                  customTextField(title: password, hint: passwordHint),
                  customTextField(title: retypePassword, hint: passwordHint),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        forgetPass,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Checkbox(
                          checkColor: redColor,
                          fillColor:
                              WidgetStateProperty.all(Colors.transparent),
                          value: isCheck,
                          onChanged: (newValue) {
                            setState(() {
                              isCheck = newValue;
                            });
                          }),
                      const SizedBox(width: 10),
                      Expanded(
                        child: RichText(
                            text: const TextSpan(children: [
                          TextSpan(
                            text: 'I agree To tha',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: fontGrey,
                              fontFamily: regular,
                            ),
                          ),
                          TextSpan(
                            text: termAndCond,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: regular,
                              color: redColor,
                            ),
                          ),
                          TextSpan(
                            text: ' & ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: regular,
                              color: fontGrey,
                            ),
                          ),
                          TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: regular,
                              color: redColor,
                            ),
                          ),
                        ])),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                      width: MediaQuery.of(context).size.width - 50,
                      child: ourButton(
                        title: signup,
                        onpress: () {},
                        textcolor: Colors.white,
                        color: isCheck == true ? redColor : lightGrey,
                      )),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Get.back(),
                        child: RichText(
                          text: const TextSpan(children: [
                            TextSpan(
                              text: alreadyHaveAccount,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: fontGrey,
                              ),
                            ),
                            TextSpan(
                              text: login,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: redColor,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
