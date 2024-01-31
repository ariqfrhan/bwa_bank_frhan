import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopupSuccess extends StatelessWidget {
  const TopupSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Top Up Wallet Success!',
              style: blackText.copyWith(fontSize: 20, fontWeight: semibold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Use the money wisely and\ngrow your finance',
              style: greyText.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFilledButton(
              title: 'Back to Home',
              onPressed: () {
                Get.offAllNamed(Routes.homepage);
              },
              width: 183,
            )
          ],
        ),
      ),
    );
  }
}
