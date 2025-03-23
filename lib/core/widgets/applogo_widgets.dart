import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/images.dart';
import 'package:flutter/material.dart';

Widget applogoWidget() {
  return Container(
    width: 77,
    height: 77,
    padding: const EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(icAppLogo),
    ),
  );
}
