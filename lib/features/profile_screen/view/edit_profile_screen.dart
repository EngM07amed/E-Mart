import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/images.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/core/widgets/custom_textfiled.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.all(16),
        margin: EdgeInsets.only(top: 50, left: 12, right: 12),
        decoration: BoxDecoration(
            color: whiteColor, borderRadius: BorderRadius.circular(10)),
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
                child: Image.asset(
                  imgProfile2,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ourButton(
                color: redColor,
                onpress: () {},
                textcolor: whiteColor,
                title: 'change'),
            Divider(),
            SizedBox(height: 20),
            customTextField(hint: nameHint, title: name, isPass: false),
            customTextField(hint: passwordHint, title: password, isPass: true),
            SizedBox(height: 20),
            SizedBox(
              width: MediaQuery.of(context).size.width - 60,
              child: ourButton(
                  color: redColor,
                  onpress: () {},
                  textcolor: whiteColor,
                  title: 'save'),
            ),
          ],
        ),
      ),
    ));
  }
}
