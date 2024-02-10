import 'package:bwa_bank_frhan/models/operatorcard_model.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:flutter/material.dart';

class ProviderItem extends StatelessWidget {
  final OperatorCardModel operator;
  final bool isSelected;
  const ProviderItem(
      {super.key,
      required this.operator,
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
          Image.network(
            operator.thumbnail.toString(),
            height: 30,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                operator.name.toString(),
                style: blackText.copyWith(fontSize: 16, fontWeight: medium),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Available',
                style: greyText.copyWith(fontSize: 12),
              )
            ],
          )
        ],
      ),
    );
  }
}
