import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/views/pages/signin_screen.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  List<String> titles = [
    "Grow Your\nFinancial Today",
    "Build From\nZero to Freedom",
    "Start Together"
  ];
  List<String> subtitles = [
    "Our system is helping you to achieve a better goal",
    "We provide tips for you so that you can adapt easier",
    "We will guide you to where you wanted it too"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              items: [
                Image.asset(
                  'assets/onboarding_1.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/onboarding_2.png',
                  height: 331,
                ),
                Image.asset(
                  'assets/onboarding_3.png',
                  height: 331,
                )
              ],
              options: CarouselOptions(
                  height: 331,
                  viewportFraction: 1,
                  enableInfiniteScroll: false,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  }),
              carouselController: carouselController,
            ),
            const SizedBox(
              height: 80,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 24),
              decoration: BoxDecoration(
                  color: whiteColor, borderRadius: BorderRadius.circular(20)),
              child: Column(
                children: [
                  Text(
                    titles[currentIndex],
                    style: blackText.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 26,
                  ),
                  Text(
                    subtitles[currentIndex],
                    style: greyText.copyWith(fontSize: 16, fontWeight: regular),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  currentIndex == 2
                      ? Column(
                          children: [
                            CustomFilledButton(
                              title: 'Get Started',
                              onPressed: () {},
                            ),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const SigninScreen(),
                                      ));
                                },
                                child: Text(
                                  "Sign In",
                                  style: greyText.copyWith(
                                      fontSize: 16, fontWeight: semibold),
                                ))
                          ],
                        )
                      : Row(
                          children: [
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      currentIndex == 0 ? blueColor : lightBg),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      currentIndex == 1 ? blueColor : lightBg),
                            ),
                            Container(
                              width: 12,
                              height: 12,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color:
                                      currentIndex == 2 ? blueColor : lightBg),
                            ),
                            const Spacer(),
                            ElevatedButton(
                              onPressed: () {
                                carouselController.nextPage();
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: purpleColor,
                                  foregroundColor: whiteColor),
                              child: Text(
                                'Continue',
                                style: whiteText.copyWith(
                                    fontSize: 16, fontWeight: semibold),
                              ),
                            )
                          ],
                        )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
