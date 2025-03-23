import 'package:emart_app/core/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({title, icon}) {
  return Container(
    padding: const EdgeInsets.all(4),
    margin: const EdgeInsets.symmetric(horizontal: 4),
    width: 200,
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(10),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.1),
          offset: const Offset(0, 2),
          blurRadius: 5,
        ),
      ],
    ),
    child: Row(
      children: [
        Image.asset(
          icon,
          width: 60,
          fit: BoxFit.fill,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(
          title,
          style: const TextStyle(
            fontFamily: semibold,
            color: darkFontGrey,
          ),
        )
      ],
    ),
  );
}
