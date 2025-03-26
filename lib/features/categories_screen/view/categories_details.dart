import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/controller/product_controller.dart';
import 'package:emart_app/core/services/firestore_services.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/features/categories_screen/view/item_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesDetails extends StatelessWidget {
  const CategoriesDetails({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProductController>();
    return bgWidget(
      Scaffold(
          appBar: AppBar(
            iconTheme: const IconThemeData(color: whiteColor),
            title: Text(
              title!,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, color: whiteColor),
            ),
          ),
          body: StreamBuilder(
              stream: FirestoreServices.getProducts(title),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ),
                  );
                } else if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No products found',
                      style: TextStyle(color: darkFontGrey),
                    ),
                  );
                } else {
                  var data = snapshot.data!.docs;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 8),
                        child: Row(
                          children: List.generate(
                            controller.subcat.length,
                            (index) => Container(
                              width: 120,
                              height: 60,
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 5,
                                    offset: const Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "${controller.subcat[index]}",
                                  style: const TextStyle(
                                    fontFamily: semibold,
                                    color: darkFontGrey,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GridView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.only(top: 10),
                            itemCount: data.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio:
                                  0.7, // تحديد نسبة الطول إلى العرض
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () => Get.to(() => ItemDetails(
                                      title: "laptop hp",
                                      data: data[index],
                                    )),
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 5,
                                        offset: const Offset(0, 2),
                                      )
                                    ],
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        imgP1,
                                        width: double.infinity,
                                        height: 120,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        'laptop hp',
                                        style: const TextStyle(
                                          fontFamily: semibold,
                                          color: darkFontGrey,
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        '\$1000',
                                        style: const TextStyle(
                                          fontFamily: bold,
                                          color: redColor,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                }
              })),
    );
  }
}
