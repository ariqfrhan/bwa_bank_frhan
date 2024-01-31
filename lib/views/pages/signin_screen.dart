import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

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
            "Sign In &\nGrow Your Finance",
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email Address',
                      style: blackText.copyWith(fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          focusColor: blueColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: blackText.copyWith(fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 4,
                    ),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                          focusColor: blueColor,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12)),
                          contentPadding: const EdgeInsets.all(12)),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: () {},
                        child: Text(
                          'Forgot Password',
                          style: blueText.copyWith(fontWeight: regular),
                        ))),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: purpleColor,
                          foregroundColor: whiteColor),
                      child: Text(
                        'Sign In',
                        style: whiteText.copyWith(
                            fontWeight: semibold, fontSize: 16),
                      )),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          TextButton(
              onPressed: () {},
              child: Text(
                "Create Account",
                style: greyText.copyWith(fontWeight: regular, fontSize: 16),
              ))
        ],
      ),
    );
  }
}
