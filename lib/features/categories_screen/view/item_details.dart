import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/controller/product_controller.dart';
import 'package:emart_app/core/widgets/our_button.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, this.title, this.data});
  final String? title;
  final dynamic? data;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());

    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: Text(
          title!,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.share)),
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // صورة المنتج
                    SizedBox(
                      height: 350,
                      child: PageView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 10),

                    // اسم المنتج
                    Text(
                      title!,
                      style:
                          const TextStyle(fontSize: 16, fontFamily: semibold),
                    ),
                    const SizedBox(height: 10),

                    // تقييم المنتج
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemSize: 25,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print("التقييم: $rating");
                      },
                    ),
                    const SizedBox(height: 10),

                    // سعر المنتج
                    const Text(
                      '\$30,000',
                      style: TextStyle(
                          fontSize: 18, fontFamily: bold, color: redColor),
                    ),
                    const SizedBox(height: 10),

                    // اختيار اللون
                    Obx(() => Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                offset: const Offset(0, 2),
                                blurRadius: 5,
                              )
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              children: [
                                const SizedBox(
                                  width: 100,
                                  child: Text(
                                    'Color',
                                    style: TextStyle(color: textfieldGrey),
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    3,
                                    (index) => InkWell(
                                      onTap: () {
                                        controller.changeColorIndex(index);
                                      },
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 40,
                                            height: 40,
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 4),
                                            decoration: BoxDecoration(
                                              color: Colors.primaries[index],
                                              shape: BoxShape.circle,
                                            ),
                                          ),
                                          Visibility(
                                            visible: index ==
                                                controller.colorIndex.value,
                                            child: const Icon(Icons.done,
                                                color: Colors.white),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                    const SizedBox(height: 10),

                    Obx(
                      () => Container(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 100,
                              child: Text(
                                'Quantity',
                                style: TextStyle(color: textfieldGrey),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.decreaseQuantity();
                                controller.calaulateTotalPrice(
                                    int.parse(data['p_price']));
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            Text(
                              '${controller.quantity.value}',
                              style: const TextStyle(
                                fontFamily: bold,
                                fontSize: 16,
                                color: darkFontGrey,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                controller.increaseQuantity(
                                    int.parse(data['p_quantity']));
                                controller.calaulateTotalPrice(
                                    int.parse(data['p_price']));
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        const Text(
                          'Total:',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: bold,
                              color: textfieldGrey),
                        ),
                        Text(
                          '${controller.totalPrice.value}',
                          style: TextStyle(
                              fontSize: 16, fontFamily: bold, color: redColor),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    const Text('Description',
                        style: TextStyle(
                            fontFamily: semibold, color: darkFontGrey)),
                    const SizedBox(height: 10),
                    Text('${data['p_desc']}',
                        style: const TextStyle(color: darkFontGrey)),
                    ListTile(
                      title: const Text('Video'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Review'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text('Privacy Policy'),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
              color: redColor,
              onpress: () {
                controller.addToCart(
                  color: data['p_color'][controller.colorIndex.value],
                  img: data['p_imags'][0],
                  qty: controller.quantity.value,
                  sellername: data['p_sellername'],
                  title: data['p_name'],
                  tprice: controller.totalPrice.value,
                );

                Fluttertoast.showToast(
                  msg: "Added to cart",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0,
                );
              },
              textcolor: whiteColor,
              title: 'Add to cart',
            ),
          ),
        ],
      ),
    );
  }
}
