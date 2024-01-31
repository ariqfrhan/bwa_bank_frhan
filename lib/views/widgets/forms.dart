import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFormField extends StatelessWidget {
  final String title;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomFormField({
    super.key,
    required this.title,
    this.obscureText = false,
    this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: blackText.copyWith(fontWeight: medium),
        ),
        const SizedBox(
          height: 4,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
              focusColor: blueColor,
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              contentPadding: const EdgeInsets.all(12)),
        ),
      ],
    );
  }
}
