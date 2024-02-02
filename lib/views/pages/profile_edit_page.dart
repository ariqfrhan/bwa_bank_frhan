import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/models/user_edit_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class ProfileEdit extends StatefulWidget {
  const ProfileEdit({super.key});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  final usernameController = TextEditingController(text: '');
  final fullnameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');

  @override
  void initState() {
    super.initState();

    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccessLogin) {
      usernameController.text = authState.user.username!;
      fullnameController.text = authState.user.name!;
      emailController.text = authState.user.email!;
      passwordController.text = authState.user.password!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthFailed) {
          Utils.getSnackBar('Gagal mengupdate data');
        }
        if (state is AuthSuccessLogin) {
          Get.toNamed(Routes.profileSuccess);
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () => Get.back(),
                child: const Icon(Icons.arrow_back_ios_new)),
            title: const Text('Edit Profile'),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
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
                        controller: usernameController, title: 'Username'),
                    const SizedBox(
                      height: 16,
                    ),
                    CustomFormField(
                        controller: fullnameController, title: 'Fullname'),
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
                            title: 'Update Now',
                            onPressed: () {
                              context.read<AuthBloc>().add(AuthUpdateUser(
                                UserEditFormModel(
                                  username: usernameController.text,
                                  fullname: fullnameController.text,
                                  email: emailController.text,
                                  password: passwordController.text
                                )
                              ));
                            },
                          )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
