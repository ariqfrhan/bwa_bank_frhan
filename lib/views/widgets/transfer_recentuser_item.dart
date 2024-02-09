import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferRecentUserItem extends StatelessWidget {
  final UserModel user;

  final String? imgUrl;
  final String? name;
  final String? username;
  final bool isVerified;
  final bool isSelected;

  const TransferRecentUserItem(
      {super.key,
      required this.user,
      this.imgUrl,
      this.name,
      this.username,
      this.isVerified = false,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor),
      child: Row(
        children: [
          Container(
            width: 45,
            height: 45,
            margin: const EdgeInsets.only(right: 14),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                    image: user.profilePicture == null
                        ? const AssetImage('assets/photo.png')
                        : NetworkImage(user.profilePicture!) as ImageProvider)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name!,
                style: blackText.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '@${user.username}',
                style: greyText.copyWith(fontSize: 12, fontWeight: regular),
              )
            ],
          ),
          const Spacer(),
          user.verified == 1
              ? Row(
                  children: [
                    Icon(
                      Icons.check_circle,
                      color: greenColor,
                      size: 14,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      'Verified',
                      style: greenText,
                    ),
                  ],
                )
              : const SizedBox(
                  height: 0,
                )
        ],
      ),
    );
  }
}
