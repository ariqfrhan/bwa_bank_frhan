import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {

  final String title;
  final double width;
  final double height;
  final VoidCallback? onPressed;
  
  const CustomFilledButton({
    super.key,
    required this.title,
    this.width = double.infinity,
    this.height = 50,
    this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {
          onPressed;
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: purpleColor, foregroundColor: whiteColor),
        child: Text(
          title,
          style: whiteText.copyWith(fontSize: 16, fontWeight: semibold),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
