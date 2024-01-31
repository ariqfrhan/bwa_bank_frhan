import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/bank_item.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopupPage extends StatelessWidget {
  const TopupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: const Icon(Icons.arrow_back_ios_new),
        ),
        title: const Text('Top Up'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          const SizedBox(
            height: 30,
          ),
          Text(
            'Wallet',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Image.asset(
                'assets/bg_card.png',
                width: 80,
              ),
              const SizedBox(
                width: 16,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '8008 2208 1920',
                    style: blackText.copyWith(fontSize: 16, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Ariq Farhan',
                    style: greyText.copyWith(
                      fontSize: 14,
                    ),
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 40,
          ),
          Text(
            'Select Bank',
            style: blackText.copyWith(fontSize: 16, fontWeight: semibold),
          ),
          const SizedBox(
            height: 14,
          ),
          const BankItem(
            imgUrl: 'assets/ic_bca.png',
            name: 'Bank BCA',
            isSelected: true,
          ),
          const BankItem(imgUrl: 'assets/ic_bni.png', name: 'Bank BNI'),
          const BankItem(imgUrl: 'assets/ic_mandiri.png', name: 'Bank Mandiri'),
          const BankItem(imgUrl: 'assets/ic_icbc.png', name: 'Bank OCBC'),
          const SizedBox(
            height: 12,
          ),
          CustomFilledButton(
            title: 'Continue',
            onPressed: () {
              Get.toNamed(Routes.topupAmount);
            },
          )
        ],
      ),
    );
  }
}
