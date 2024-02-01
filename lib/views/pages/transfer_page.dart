import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:bwa_bank_frhan/views/widgets/transfer_recentuser_item.dart';
import 'package:bwa_bank_frhan/views/widgets/transfer_result_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransferPage extends StatelessWidget {
  const TransferPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Transfer'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Search',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: "",
            hint: 'By Username',
            isShowTitle: false,
          ),
          // recentUsers(),
          resultUsers(),
          const SizedBox(
            height: 274,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Get.toNamed(Routes.transferAmount);
            },
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }

  Widget recentUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Recent Users',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/photo_2.png',
            name: 'Kak Gema',
            username: 'tapitunggudulu',
            isSelected: true,
            isVerified: true,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/photo.png',
            name: 'Kak Seto',
            username: 'setos',
            isVerified: false,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/photo_2.png',
            name: 'Kak Gema',
            username: 'tapitunggudulu',
            isVerified: false,
          ),
          const TransferRecentUserItem(
            imgUrl: 'assets/photo_2.png',
            name: 'Kak Gema',
            username: 'tapitunggudulu',
            isSelected: true,
            isVerified: false,
          ),
        ],
      ),
    );
  }

  Widget resultUsers() {
    return Container(
      margin: const EdgeInsets.only(top: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Results',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          const Wrap(
            spacing: 17,
            runSpacing: 17,
            children: [
              TransferResultItem(
                imgUrl: 'assets/photo_2.png',
                name: 'Kak Gema',
                username: 'tapitunggudulu',
                isSelected: true,
                isVerified: true,
              ),
              TransferResultItem(
                imgUrl: 'assets/photo_2.png',
                name: 'Kak Gema',
                username: 'tapitunggudulu',
                isSelected: false,
                isVerified: false,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
