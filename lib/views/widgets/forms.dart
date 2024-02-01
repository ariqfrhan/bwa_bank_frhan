import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final bool isShowTitle;
  final TextEditingController? controller;
  final String? hint;

  const CustomFormField(
      {super.key,
      required this.title,
      this.obscureText = false,
      this.isShowTitle = true,
      this.controller,
      this.hint});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        isShowTitle
            ? Text(
                title,
                style: blackText.copyWith(fontWeight: medium),
              )
            : const SizedBox(
                height: 0,
              ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: greyText,
              focusColor: blueColor,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.all(12)),
        ),
      ],
    );
  }
}
