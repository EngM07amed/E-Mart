import 'package:emart_app/core/consts/consts.dart';
import 'package:emart_app/core/consts/list.dart';
import 'package:emart_app/core/widgets/bg_wigets.dart';
import 'package:emart_app/features/auth/controllers/auth_controller.dart';
import 'package:emart_app/features/auth_screen/views/login_screen.dart';
import 'package:emart_app/features/profile_screen/components/details_card.dart';
import 'package:emart_app/features/profile_screen/view/edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const EditProfileScreen());
                },
                child: const Icon(Icons.edit, color: whiteColor),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        offset: const Offset(0, 2),
                        blurRadius: 5,
                      )
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      imgProfile2,
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Dummy User',
                        style:
                            TextStyle(fontFamily: semibold, color: whiteColor),
                      ),
                      SizedBox(height: 10),
                      Text(' dummy@example.com',
                          style: TextStyle(
                            color: whiteColor,
                          ))
                    ],
                  ),
                ),
                OutlinedButton(
                  onPressed: () async {
                    await Get.put(AuthController()).signoutMethod(context);
                    Get.offAll(() => const LoginScreen());
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: whiteColor)),
                  child: const Text(
                    'logout',
                    style: TextStyle(fontFamily: semibold, color: whiteColor),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              detailsCard(
                  count: '00',
                  title: 'in your cart',
                  width: MediaQuery.of(context).size.width / 3.4),
              detailsCard(
                  count: '32',
                  title: 'in your Wishlist',
                  width: MediaQuery.of(context).size.width / 3.4),
              detailsCard(
                  count: '675',
                  title: 'your orders',
                  width: MediaQuery.of(context).size.width / 3.4),
            ],
          ),
          Container(
            color: redColor,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      offset: const Offset(0, 2),
                    )
                  ]),
              child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(
                        profileButtonsIcon[index],
                        width: 22,
                      ),
                      title: Text(
                        profileButtonsList[index],
                        style: const TextStyle(
                          fontFamily: semibold,
                          color: darkFontGrey,
                        ),
                      ),
                    );
                  },
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: lightGrey,
                    );
                  },
                  itemCount: profileButtonsList.length),
            ),
          )
        ]),
      ),
    ));
  }
}
