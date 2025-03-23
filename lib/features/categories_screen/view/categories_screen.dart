import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/list.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/features/categories_screen/view/categories_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: whiteColor),
          title: const Text(
            categories,
            style: TextStyle(fontFamily: bold, color: whiteColor),
          ),
        ),
        body: Container(
          padding: const EdgeInsets.all(12),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: categoriesList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => Get.to(
                    () => CategoriesDetails(title: categoriesList[index])),
                child: Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        categoriesImages[index],
                        width: 200,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        categoriesList[index],
                        style: const TextStyle(color: darkFontGrey),
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
