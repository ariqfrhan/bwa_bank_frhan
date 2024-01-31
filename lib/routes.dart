

import 'package:bwa_bank_frhan/views/pages/onboarding_screen.dart';
import 'package:bwa_bank_frhan/views/pages/signin_screen.dart';
import 'package:bwa_bank_frhan/views/pages/splash_screen.dart';
import 'package:get/get.dart';

class Routes{
  static String splash = '/';
  static String onboarding = '/onboarding';
  static String signin = '/sign-in';

  static List<GetPage> routes = [
    GetPage(
      name: splash, 
      page: () => const SplashScreen() 
    ),
    GetPage(
      name: onboarding, 
      page: () => const OnboardingScreen() 
    ),
    GetPage(
      name: signin, 
      page: () => const SigninScreen()
    ),

  ];

}