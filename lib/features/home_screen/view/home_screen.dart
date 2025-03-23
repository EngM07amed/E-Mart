import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/list.dart';
import 'package:emart_app/core/widgets/home_button.dart';
import 'package:emart_app/features/home_screen/components/featured_button.dart';
import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      color: lightGrey,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 4,
                    ),
                  ],
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.search),
                    fillColor: whiteColor,
                    filled: true,
                    hintText: searchanything,
                    hintStyle: TextStyle(
                      color: textfieldGrey,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              SizedBox(
                height: 150,
                child: Swiper(
                  itemBuilder: (context, index) {
                    final image = slidersList[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: slidersList.length,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  2,
                  (index) => homeButtons(
                    width: MediaQuery.of(context).size.width / 2.5,
                    height: MediaQuery.of(context).size.height * 0.15,
                    icon: index == 0 ? icTodaysDeal : icFlashDeal,
                    title: index == 0 ? todayDeal : flashsale,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 150,
                child: Swiper(
                  itemBuilder: (context, index) {
                    final image = secondSlidersList[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: secondSlidersList.length,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  3,
                  (index) => homeButtons(
                    width: MediaQuery.of(context).size.width / 3.5,
                    height: MediaQuery.of(context).size.height * 0.15,
                    icon: index == 0
                        ? icTopCategories
                        : index == 1
                            ? icBrands
                            : icTopSeller,
                    title: index == 0
                        ? topCategories
                        : index == 1
                            ? brand
                            : topSellers,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  featuredCategories,
                  style: TextStyle(
                    fontFamily: semibold,
                    fontSize: 18,
                    color: darkFontGrey,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                      3,
                      (index) => Column(children: [
                            featuredButton(
                                icon: featuredImages1[index],
                                title: featuredTitles1[index]),
                            const SizedBox(height: 10),
                            featuredButton(
                                icon: featuredImages2[index],
                                title: featuredTitles2[index]),
                          ])).toList(),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.all(12),
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: redColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      featuredProducts,
                      style: TextStyle(
                        fontFamily: bold,
                        fontSize: 18,
                        color: whiteColor,
                      ),
                    ),
                    const SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: List.generate(
                              6,
                              (index) => Container(
                                    padding: const EdgeInsets.all(8),
                                    margin: const EdgeInsets.symmetric(horizontal: 4),
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
                                  ))),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 150,
                child: Swiper(
                  itemBuilder: (context, index) {
                    final image = secondSlidersList[index];
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      clipBehavior: Clip.antiAlias,
                      child: Image.asset(
                        image,
                        fit: BoxFit.fill,
                      ),
                    );
                  },
                  autoplay: true,
                  itemCount: secondSlidersList.length,
                ),
              ),
              const SizedBox(height: 20),
              GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    mainAxisExtent: 300,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 200,
                            fit: BoxFit.cover,
                          ),
                          const Spacer(),
                          const Text(
                            'Laptop krffrkcfr',
                            style: TextStyle(
                                fontFamily: semibold, color: darkFontGrey),
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
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
