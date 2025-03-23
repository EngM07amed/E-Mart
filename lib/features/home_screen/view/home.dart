import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/features/cart_screen/view/cart_screen.dart';
import 'package:emart_app/features/categories_screen/view/categories_screen.dart';
import 'package:emart_app/features/home_screen/controller/home_controller.dart';
import 'package:emart_app/features/home_screen/view/home_screen.dart';
import 'package:emart_app/features/profile_screen/view/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];
    var navBody = [
      const HomeScreen(),
      const CategoriesScreen(),
      const CartScreen(),
      const ProfileScreen(),
    ];

    return Scaffold(
        body: Column(
          children: [
            Obx(() => Expanded(
                child: navBody.elementAt(controller.currentNevIndex.value)))
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
              currentIndex: controller.currentNevIndex.value,
              onTap: (value) {
                controller.currentNevIndex.value = value;
              },
              items: navbarItem,
              selectedItemColor: redColor,
              selectedLabelStyle: const TextStyle(fontFamily: semibold),
              type: BottomNavigationBarType.fixed,
              backgroundColor: whiteColor),
        ));
  }
}
