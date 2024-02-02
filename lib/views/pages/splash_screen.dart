import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccessLogin) {
          print("User successfully authenticated");
          Get.offAllNamed(Routes.homepage);
        }

        if (state is AuthFailed) {
          print("Authentication failed: ${state.toString()}");
          Get.offAllNamed(Routes.onboarding);
        }
      },
      child: Scaffold(
        backgroundColor: darkBg,
        body: Center(
          child: Container(
            width: 155,
            height: 50,
            decoration: const BoxDecoration(
                image:
                    DecorationImage(image: AssetImage('assets/logo_dark.png'))),
          ),
        ),
      ),
    );
  }
}
