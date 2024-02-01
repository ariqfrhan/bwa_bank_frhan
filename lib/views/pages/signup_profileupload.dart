import 'dart:convert';
import 'dart:io';

import 'package:bwa_bank_frhan/models/signup_form_model.dart';
import 'package:bwa_bank_frhan/routes.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:bwa_bank_frhan/views/widgets/buttons.dart';
import 'package:bwa_bank_frhan/views/widgets/forms.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignupProfileUpload extends StatefulWidget {
  const SignupProfileUpload({super.key});

  @override
  State<SignupProfileUpload> createState() => _SignupProfileUploadState();
}

class _SignupProfileUploadState extends State<SignupProfileUpload> {
  late SignupFormModel data;

  @override
  void initState() {
    super.initState();
    data = Get.arguments as SignupFormModel;
  }

  XFile? selectedImage;
  final pinController = TextEditingController(text: '');

  bool validation() {
    if (pinController.text.length != 6) {
      return false;
    }

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          GestureDetector(
            onTap: () async {
              final image = await selectImage();
              setState(() {
                selectedImage = image;
              });
            },
            child: Container(
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: whiteColor),
              child: Column(
                children: [
                  Container(
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
                                image: FileImage(File(selectedImage!.path)))),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    data.name.toString(),
                    style: blackText.copyWith(fontSize: 18, fontWeight: medium),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFormField(
                    keyboardType: TextInputType.number,
                    controller: pinController,
                    title: "Set PIN (6 digit number)",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomFilledButton(
                    title: 'Continue',
                    onPressed: () {
                      if (validation()) {
                        Get.toNamed(Routes.signupVerifyKtp,
                            arguments: SignupFormModel(
                                pin: pinController.text,
                                profilePicture: selectedImage == null
                                    ? null
                                    : 'data:image/png;base64,${base64Encode(File(selectedImage!.path).readAsBytesSync())}'));
                      } else {
                        Utils.getSnackBar('PIN harus berjumlah 6 digit');
                      }
                    },
                  )
                ],
              ),
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
      ),
    );
  }
}
