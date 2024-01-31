import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/profile_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          'My Profile',
          style: blackText.copyWith(fontSize: 18, fontWeight: semibold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 40,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 22),
            decoration: BoxDecoration(
                color: whiteColor, borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage('assets/photo.png'))),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                        decoration: BoxDecoration(
                            color: greenColor,
                            borderRadius: BorderRadius.circular(100)),
                        child: Icon(
                          Icons.check,
                          color: whiteColor,
                        )),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Ariq Farhan',
                  style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
                ),
                const SizedBox(
                  height: 40,
                ),
                ProfileMenuItem(
                  icon: Icons.person_outline,
                  title: 'Edit Profile',
                  onTap: () async{
                    var data = await Get.toNamed(Routes.pin);
                    if (data == true) {
                      Get.toNamed(Routes.profileEdit);
                    }
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.shield_outlined,
                  title: 'My PIN',
                  onTap: () async {
                    var data = await Get.toNamed(Routes.pin);
                    if (data == true) {
                      Get.toNamed(Routes.profileEdit);
                    }
                  },
                ),
                ProfileMenuItem(
                  icon: Icons.wallet_outlined,
                  title: 'Wallet Settings',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.track_changes_outlined,
                  title: 'My Rewards',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.view_sidebar_outlined,
                  title: 'Help Center',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  icon: Icons.logout,
                  title: 'Log Out',
                  onTap: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          TextButton(onPressed: (){}, child: Text('Report a Problem', style: greyText.copyWith(
            fontSize: 16
          ),))
        ],
      ),
    );
  }
}
