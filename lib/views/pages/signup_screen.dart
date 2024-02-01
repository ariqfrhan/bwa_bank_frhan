import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/models/signup_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final nameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  bool validation() {
    if (nameController.text.isEmpty ||
        emailController.text.isEmpty ||
        passwordController.text.isEmpty) {
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            Utils.getSnackBar(state.e.toString());
          }

          if (state is AuthSuccess) {
            Get.toNamed(Routes.signupUpload,
                arguments: SignupFormModel(
                    name: nameController.text,
                    email: emailController.text,
                    password: passwordController.text));
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
                    CustomFormField(
                        controller: nameController, title: 'Fullname'),
                    const SizedBox(
                      height: 16,
                    ),
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
                    const SizedBox(
                      height: 30,
                    ),
                    state is AuthLoading
                        ? const CircularProgressIndicator()
                        : CustomFilledButton(
                            title: 'Continue',
                            onPressed: () {
                              if (validation()) {
                                context
                                    .read<AuthBloc>()
                                    .add(AuthCheckEmail(emailController.text));
                              } else {
                                Utils.getSnackBar('Please fill all fields');
                              }
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
          );
        },
      ),
    );
  }
}
