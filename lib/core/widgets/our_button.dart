import 'package:emart_app/core/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourButton({onpress, color, textcolor, title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.all(12),
    ),
    onPressed: onpress,
    child: Text(
      title,
      style: TextStyle(fontFamily: bold, color: textcolor),
    ),
  );
}
