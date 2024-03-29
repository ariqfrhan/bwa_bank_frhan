import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class HomeServicesItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final VoidCallback? onTap;

  const HomeServicesItem(
      {super.key, required this.iconUrl, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ZoomTapAnimation(
          onTap: onTap,
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: whiteColor),
            child: Center(
              child: Image.asset(
                iconUrl,
                width: 26,
              ),
            ),
          ),
        ),
        Text(
          title,
          style: blackText.copyWith(fontSize: 14, fontWeight: medium),
        )
      ],
    );
  }
}
