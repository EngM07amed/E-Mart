import 'package:emart_app/core/consts/colors.dart';
import 'package:emart_app/core/consts/styles.dart';
import 'package:flutter/material.dart';

Widget customTextField({String? title, String? hint, controllar, isPass}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title!,
        style: const TextStyle(
          fontSize: 16,
          fontFamily: semibold,
        ),
      ),
      const SizedBox(height: 5),
      TextFormField(
        obscureText: isPass,
        controller: controllar,
        decoration: InputDecoration(
            hintStyle:
                const TextStyle(fontFamily: semibold, color: textfieldGrey),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: redColor))),
      ),
      const SizedBox(
        height: 5,
      )
    ],
  );
}
