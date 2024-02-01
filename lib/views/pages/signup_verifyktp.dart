import 'dart:convert';
import 'dart:io';

import 'package:bwa_bank_frhan/blocs/bloc/auth_bloc.dart';
import 'package:bwa_bank_frhan/models/signup_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupVerifyKtp extends StatefulWidget {
  const SignupVerifyKtp({super.key});

  @override
  State<SignupVerifyKtp> createState() => _SignupVerifyKtpState();
}

class _SignupVerifyKtpState extends State<SignupVerifyKtp> {
  late SignupFormModel data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments as SignupFormModel;
  }

  bool validation() {
    if (selectedImage == null) {
      print(selectedImage.toString());
      return false;
    }
    return true;
  }

  XFile? selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightBg,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            Utils.getSnackBar('Pendaftaran gagal');
          }

          if (state is AuthSuccessRegister) {
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
                "Verify Your\nAccount",
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
                    GestureDetector(
                      onTap: () async {
                        final image = await selectImage();
                        setState(() {
                          selectedImage = image;
                        });
                      },
                      child: Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: lightBg,
                            image: selectedImage == null
                                ? const DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage('assets/ic_upload.png'))
                                : DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        FileImage(File(selectedImage!.path)))),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text(
                      'Passport / ID Card',
                      style:
                          blackText.copyWith(fontSize: 18, fontWeight: medium),
                    ),
                    const SizedBox(
                      height: 30,
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
                                context.read<AuthBloc>().add(AuthRegister(
                                    data.copyWith(
                                        ktp: selectedImage != null
                                            ? 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'
                                            : null)));
                              } else {
                                Utils.getSnackBar('Gambar tidak boleh kosong');
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
                  onPressed: () {
                    context.read<AuthBloc>().add(AuthRegister(data));
                  },
                  child: Text(
                    "Skip For Now",
                    style: greyText.copyWith(fontWeight: regular, fontSize: 16),
                  ))
            ],
          );
        },
      ),
    );
  }
}
