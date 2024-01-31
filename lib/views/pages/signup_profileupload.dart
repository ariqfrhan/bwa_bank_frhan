import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SignupProfileUpload extends StatelessWidget {
  const SignupProfileUpload({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        children: [
          Container(
            width: 155,
            height: 50,
            margin: const EdgeInsets.symmetric(vertical: 100),
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/logo_light.png'))),
          ),
          Text(
            "Join Us to Unlock\nYour Growth",
            style: blackText.copyWith(fontSize: 20, fontWeight: semibold),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Column(
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lightBg,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                          image: AssetImage('assets/ic_upload.png'))),
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Ariq Farhan',
                  style: blackText.copyWith(fontSize: 18, fontWeight: medium),
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomFormField(
                  title: "Set PIN (6 digit number)",
                  obscureText: true,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {
                    Get.toNamed(Routes.signupVerifyKtp);
                  },
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () => Get.toNamed(Routes.signin),
              child: Text(
                "Sign In",
                style: greyText.copyWith(fontWeight: regular, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
