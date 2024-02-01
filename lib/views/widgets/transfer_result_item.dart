import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TransferResultItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String username;
  final bool isVerified;
  final bool isSelected;
  const TransferResultItem(
      {super.key,
      required this.imgUrl,
      required this.name,
      required this.username,
      this.isVerified = false,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? blueColor : whiteColor,
          width: 2
        )
      ),
      child: Column(
        children: [
          Container(
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: AssetImage('assets/photo.png'))),
              child: isVerified
                  ? Align(
                      alignment: Alignment.topRight,
                      child: Icon(
                        Icons.check_circle,
                        color: greenColor,
                        size: 24,
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    )),
          const SizedBox(
            height: 14,
          ),
          Text(
            name,
            style: blackText.copyWith(fontSize: 16, fontWeight: medium),
          ),
          const SizedBox(
            height: 2,
          ),
          Text('@$username', style: greyText.copyWith(
            fontSize: 12, fontWeight: regular
          ),)
        ],
      ),
    );
  }
}
