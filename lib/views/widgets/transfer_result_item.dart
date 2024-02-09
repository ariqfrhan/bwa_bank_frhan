import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class TransferResultItem extends StatelessWidget {
  final UserModel user;

  final String? imgUrl;
  final String? name;
  final String? username;
  final bool isVerified;
  final bool isSelected;
  const TransferResultItem(
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
      width: 155,
      height: 175,
      padding: const EdgeInsets.symmetric(vertical: 22, horizontal: 12),
      decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(20),
          border:
              Border.all(color: isSelected ? blueColor : whiteColor, width: 2)),
      child: Column(
        children: [
          Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: user.profilePicture == null
                          ? const AssetImage('assets/photo.png')
                          : NetworkImage(user.profilePicture!)
                              as ImageProvider)),
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
            user.name!.length > 16 ? user.name!.substring(0, 16) : user.name!,
            style: blackText.copyWith(fontSize: 16, fontWeight: medium),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(
            height: 2,
          ),
          Text(
            '@${user.username}'.length > 14
                ? '@${user.username}'.substring(0, 14)
                : '@${user.username}',
            style: greyText.copyWith(fontSize: 12, fontWeight: regular),
            overflow: TextOverflow.ellipsis,
          )
        ],
      ),
    );
  }
}
