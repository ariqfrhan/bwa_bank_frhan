

import 'package:bwa_bank_frhan/views/pages/buydata_page.dart';
import 'package:bwa_bank_frhan/views/pages/buydata_paket_page.dart';
import 'package:bwa_bank_frhan/views/pages/buydata_success.dart';
import 'package:bwa_bank_frhan/views/pages/home_page.dart';
import 'package:bwa_bank_frhan/views/pages/onboarding_screen.dart';
import 'package:bwa_bank_frhan/views/pages/pin_edit_page.dart';
import 'package:bwa_bank_frhan/views/pages/profile_edit_success.dart';
import 'package:bwa_bank_frhan/views/pages/pin_page.dart';
import 'package:bwa_bank_frhan/views/pages/profile_edit_page.dart';
import 'package:bwa_bank_frhan/views/pages/profile_page.dart';
import 'package:bwa_bank_frhan/views/pages/signin_screen.dart';
import 'package:bwa_bank_frhan/views/pages/signup_profileupload.dart';
import 'package:bwa_bank_frhan/views/pages/signup_screen.dart';
import 'package:bwa_bank_frhan/views/pages/signup_success.dart';
import 'package:bwa_bank_frhan/views/pages/signup_verifyktp.dart';
import 'package:bwa_bank_frhan/views/pages/splash_screen.dart';
import 'package:bwa_bank_frhan/views/pages/topup_amount_page.dart';
import 'package:bwa_bank_frhan/views/pages/topup_page.dart';
import 'package:bwa_bank_frhan/views/pages/topup_success.dart';
import 'package:bwa_bank_frhan/views/pages/transfer_amount_page.dart';
import 'package:bwa_bank_frhan/views/pages/transfer_page.dart';
import 'package:bwa_bank_frhan/views/pages/transfer_success.dart';
import 'package:get/get.dart';

class Routes{
  static String splash = '/';
  static String onboarding = '/onboarding';
  static String signin = '/sign-in';
  static String signup = '/sign-up';
  static String signupUpload = '/sign-up-upload';
  static String signupVerifyKtp = '/signup-verify-ktp';
  static String signupSuccess = '/signup-success';
  static String homepage = '/home';
  static String profile = '/profile';
  static String pin = '/pin';
  static String profileEdit = '/profile-edit';
  static String pinEdit = '/pin-edit';
  static String profileSuccess = '/profile-success';
  static String topup = '/topup';
  static String topupAmount = '/topup-amount';
  static String topupSuccess = '/topup-success';
  static String transfer = '/transfer';
  static String transferAmount = '/transfer-amount';
  static String transferSuccess = '/transfer-success';
  static String buydata = '/buydata';
  static String buydataPaket = '/buydata-paket';
  static String buydataSuccess = '/buydata-success';

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
    GetPage(
      name: signup, 
      page: () => const SignupScreen()
    ),
    GetPage(
      name: signupUpload, 
      page: () =>  const SignupProfileUpload(),
    ),
    GetPage(
      name: signupVerifyKtp, 
      page: () => const SignupVerifyKtp()
    ),
    GetPage(
      name: signupSuccess, 
      page: () => const SignupSuccess()
    ),
    GetPage(
      name: homepage, 
      page: () => const Homepage()
    ),
    GetPage(
      name: profile, 
      page: () => const ProfilePage()
    ),
    GetPage(
      name: pin, 
      page: () => const PinPage()
    ),
    GetPage(
      name: profileEdit, 
      page: () => const ProfileEdit()
    ),
    GetPage(
      name: pinEdit, 
      page: () => const EditPinPage()
    ),
    GetPage(
      name: profileSuccess, 
      page: () => const ProfileEditSuccess()
    ),
    GetPage(
      name: topup, 
      page: () => const TopupPage()
    ),
    GetPage(
      name: topupAmount, 
      page: () => const TopupAmountPage()
    ),
    GetPage(
      name: topupSuccess, 
      page: () => const TopupSuccess()
    ),
    GetPage(
      name: transfer, 
      page: () => const TransferPage()
    ),
    GetPage(
      name: transferAmount, 
      page: () => const TransferAmountPage()
    ),
    GetPage(
      name: transferSuccess, 
      page: () => const TransferSuccess()
    ),
    GetPage(
      name: buydata, 
      page: () => const BuydataPage()
    ),
    GetPage(
      name: buydataPaket, 
      page: () => const BuydataPaketPage()
    ),
    GetPage(
      name: buydataSuccess, 
      page: () => const BuydataSuccess()
    ),

  ];

}