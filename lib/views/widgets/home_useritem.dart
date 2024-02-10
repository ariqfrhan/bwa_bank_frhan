import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class HomeUserItem extends StatelessWidget {
  final UserModel user;

  const HomeUserItem({super.key, required this.user});

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
                    image: user.profilePicture != null
                        ? NetworkImage(user.profilePicture!) as ImageProvider
                        : const AssetImage('assets/photo.png'),
                    fit: BoxFit.cover)),
          ),
          Text(
            '@${user.name}',
            style: blackText.copyWith(fontSize: 12, fontWeight: semibold),
          )
        ],
      ),
    );
  }
}
