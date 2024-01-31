import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class LatestTransactionItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final String time;
  final String value;
  const LatestTransactionItem(
      {super.key,
      required this.iconUrl,
      required this.title,
      required this.time,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            iconUrl,
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: blackText.copyWith(
                  fontWeight: medium, fontSize: 16
                ),),
                const SizedBox(
                  height: 2,
                ),
                Text(time, style: greyText.copyWith(
                  fontSize: 12
                ),)
              ],
            ),
          ),
          Text(value, style: blackText.copyWith(
            fontWeight: medium, fontSize: 16
          ),)
        ],
      ),
    );
  }
}
