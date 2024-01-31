import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const ProfileMenuItem(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 30),
        child: Row(
          children: [
            Icon(
              icon,
              size: 24,
            ),
            const SizedBox(
              width: 18,
            ),
            Text(title, style: blackText.copyWith(
              fontSize: 14,
              fontWeight: medium
            ),)
          ],
        ),
      ),
    );
  }
}
