import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/list.dart';
import 'package:emart_app/core/widgets/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, this.title});
  final String? title;

  @override
  Widget build(BuildContext context) {
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
                    SizedBox(
                      height: 350, // تحديد ارتفاع مناسب
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
                    Text(
                      title!,
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: semibold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: 3, // التقييم الابتدائي
                      minRating: 1, // الحد الأدنى
                      direction: Axis.horizontal,
                      allowHalfRating: true, // السماح بنصف نجمة
                      itemCount: 5, // عدد النجوم
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
                    const Text(
                      '\$30,000',
                      style: TextStyle(
                          fontSize: 18, fontFamily: bold, color: redColor),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: textfieldGrey,
                      child: const Row(
                        children: [
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Seller',
                                style: TextStyle(
                                    color: Colors.white, fontFamily: semibold),
                              ),
                              SizedBox(height: 5),
                              Text('In House Brands',
                                  style: TextStyle(
                                      color: darkFontGrey,
                                      fontFamily: semibold,
                                      fontSize: 16)),
                            ],
                          )),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.message_rounded,
                              color: darkFontGrey,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          // borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: const Offset(0, 2),
                              blurRadius: 5,
                            )
                          ]),
                      child: Column(children: [
                        Container(
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
                                    (index) => Container(
                                          width: 40,
                                          height: 40,
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 4),
                                          decoration: BoxDecoration(
                                              color: Colors.primaries[index],
                                              shape: BoxShape.circle),
                                        )),
                              ),
                            ],
                          ),
                        ),
                        Container(
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
                              Row(children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                const Text(
                                  '0',
                                  style: TextStyle(
                                    fontFamily: bold,
                                    fontSize: 16,
                                    color: darkFontGrey,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                const Text(
                                  '(0 available)',
                                  style: TextStyle(
                                    fontFamily: bold,
                                    fontSize: 16,
                                    color: textfieldGrey,
                                  ),
                                ),
                              ]),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: const Row(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  'Total',
                                  style: TextStyle(color: textfieldGrey),
                                ),
                              ),
                              Text('\$0.00',
                                  style: TextStyle(
                                      fontFamily: bold,
                                      fontSize: 16,
                                      color: redColor))
                            ],
                          ),
                        ),
                      ]),
                    ),
                    const SizedBox(height: 10),
                    const Text('Description',
                        style: TextStyle(
                            fontFamily: semibold, color: darkFontGrey)),
                    const SizedBox(height: 10),
                    const Text('This is a dummy item and dummy description here..',
                        style: TextStyle(color: darkFontGrey)),
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                        itemDetailButtonsList.length,
                        (index) => ListTile(
                          title: Text(
                            itemDetailButtonsList[index],
                            style: const TextStyle(
                                fontFamily: semibold, color: darkFontGrey),
                          ),
                          trailing: const Icon(
                            Icons.arrow_forward,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      productsYouMayAlsoLike,
                      style: TextStyle(
                          fontFamily: bold, fontSize: 16, color: darkFontGrey),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              6,
                              (index) => Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    decoration: BoxDecoration(
                                      color: whiteColor,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(
                                          imgP1,
                                          width: 150,
                                          fit: BoxFit.cover,
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          'Laptop krffrkcfr',
                                          style: TextStyle(
                                              fontFamily: semibold,
                                              color: darkFontGrey),
                                        ),
                                        const SizedBox(height: 10),
                                        const Text(
                                          '\$600',
                                          style: TextStyle(
                                            fontFamily: bold,
                                            color: redColor,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),),),
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
              onpress: () {},
              textcolor: whiteColor,
              title: 'Add to cart',
            ),
          )
        ],
      ),
    );
  }
}
