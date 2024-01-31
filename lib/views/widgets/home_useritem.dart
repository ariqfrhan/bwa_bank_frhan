import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final String imgUrl;
  final String username;

  const HomeUserItem({super.key, required this.imgUrl, required this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 120,
      decoration: BoxDecoration(
          color: whiteColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(bottom: 13),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: AssetImage(imgUrl), fit: BoxFit.cover)),
          ),
          Text('@$username', style: blackText.copyWith(
            fontSize: 12, fontWeight: semibold
          ),)
        ],
      ),
    );
  }
}
