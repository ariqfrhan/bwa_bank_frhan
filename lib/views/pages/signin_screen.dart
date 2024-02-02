import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/models/siginin_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validation() {
    if (emailController.text.isEmpty || passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            Utils.getSnackBar('Login gagal');
          }

          if (state is AuthSuccessLogin) {
            Get.offAllNamed(Routes.homepage);
          }
        },
        builder: (context, state) {
          return ListView(
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
                    CustomFormField(
                        controller: emailController, title: 'Email Address'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                      controller: passwordController,
                      title: 'Password',
                      obscureText: true,
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
                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomFilledButton(
                            title: 'Sign In',
                            onPressed: () {
                              if (validation()) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthLogin(SigninFormModel(
                                      email: emailController.text,
                                      password: passwordController.text
                                    )));
                              }else{
                                Utils.getSnackBar('All field must be filled');
                              }
                            },
                          )
                  ],
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              TextButton(
                  onPressed: () => Get.toNamed(Routes.signup),
                  child: Text(
                    "Create Account",
                    style: greyText.copyWith(fontWeight: regular, fontSize: 16),
                  ))
            ],
          );
        },
      ),
    );
  }
}
