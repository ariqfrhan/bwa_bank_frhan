import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class BankItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final bool isSelected;
  const BankItem(
      {super.key,
      required this.imgUrl,
      required this.name,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: whiteColor,
          border: Border.all(
            width: 2,
            color: isSelected ? blueColor : whiteColor
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            imgUrl,
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                name,
                style: blackText.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                '50 min',
                style: greyText.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
