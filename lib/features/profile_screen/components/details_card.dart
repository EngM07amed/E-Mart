import 'package:emart_app/core/consts/colors.dart';
import 'package:emart_app/core/consts/styles.dart';
import 'package:flutter/material.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Container(
    padding: const EdgeInsets.all(4),
    width: width,
    decoration: BoxDecoration(
      color: whiteColor,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Column(
      children: [
        Text(
          count!,
          style: const TextStyle(
            fontFamily: bold,
            color: darkFontGrey,
            fontSize: 16,
          ),
        ),
        Text(title!, style: const TextStyle(color: darkFontGrey)),
      ],
    ),
  );
}
