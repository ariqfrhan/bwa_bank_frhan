import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:bwa_bank_frhan/views/widgets/package_item.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuydataPaketPage extends StatelessWidget {
  const BuydataPaketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Buy Package'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Phone Number',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          const CustomFormField(
            title: "",
            hint: '+62',
            isShowTitle: false,
          ),
          // recentUsers(),
          resultUsers(),
          const SizedBox(
            height: 85,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () async {
              if (await Get.toNamed(Routes.pin)) {
                Get.toNamed(Routes.buydataSuccess);
              }
            },
          ),
          const SizedBox(
            height: 50,
          )
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
            'Select Package',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Wrap(
              spacing: 17,
              runSpacing: 17,
              children: [
                PackageItem(
                  amount: 5,
                  price: 50000,
                  isSelected: true,
                ),
                PackageItem(
                  amount: 10,
                  price: 100000,
                ),
                PackageItem(
                  amount: 25,
                  price: 2000000,
                ),
                PackageItem(
                  amount: 40,
                  price: 1000000,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
