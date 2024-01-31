import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                const CustomFormField(title: 'Fullname'),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(title: 'Email Address'),
                const SizedBox(
                  height: 16,
                ),
                const CustomFormField(
                  title: 'Password',
                  obscureText: true,
                ),
                const SizedBox(
                  height: 8,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomFilledButton(
                  title: 'Continue',
                  onPressed: () {},
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: ()=> Get.toNamed(Routes.signin),
              child: Text(
                "Sign In",
                style: greyText.copyWith(fontWeight: regular, fontSize: 16),
              ))
        ],
      ),
    );
  }
}