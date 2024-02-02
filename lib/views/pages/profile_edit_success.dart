import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditSuccess extends StatelessWidget {
  const ProfileEditSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nice Update!',
              style: blackText.copyWith(fontSize: 20, fontWeight: semibold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 26,
            ),
            Text(
              'Grow your finance start\n together with us',
              style: greyText.copyWith(fontSize: 14),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            CustomFilledButton(
              title: 'Back to Home',
              onPressed: () {
                Get.offAllNamed(Routes.profile);
              },
              width: 183,
            )
          ],
        ),
      ),
    );
  }
}
