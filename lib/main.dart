import 'package:emart_app/features/categories_screen/view/categories_screen.dart';
import 'package:emart_app/features/profile_screen/view/profile_screen.dart';
import 'package:emart_app/features/splash_screen/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'core/consts/consts.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      tools: const [...DevicePreview.defaultTools],
      builder: (context) => const EMartApp(),
    ),
  );
}

class EMartApp extends StatelessWidget {
  const EMartApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      useInheritedMediaQuery: true,
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            iconTheme: IconThemeData(color: darkFontGrey)),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
