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
          onPressed?.call();
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

class CustomInputButton extends StatelessWidget {
  
  final String title;
  final VoidCallback? onTap;
  const CustomInputButton({
    super.key,
    required this.title,
    this.onTap
    });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color : numberColor
        ),
        child: Center(
          child: Text(title, style: whiteText.copyWith(
            fontSize: 22,
            fontWeight: semibold
          )),
        ),
      ),
    );
  }
}
