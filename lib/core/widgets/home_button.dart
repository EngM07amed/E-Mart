import 'package:emart_app/core/consts/consts.dart';
import 'package:flutter/material.dart';

Widget homeButtons({height, width, icon, String? title, onpress}) {
  return Container(
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 5,
        ),
      ],
    ),
    width: width,
    height: height,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(icon, width: 26),
        const SizedBox(height: 10),
        Text(
          title!,
          style: const TextStyle(fontFamily: semibold, color: darkFontGrey),
        )
      ],
    ),
  );
}
