import 'package:bwa_bank_frhan/models/data_plan_model.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:flutter/material.dart';

class PackageItem extends StatelessWidget {
  final DataPlanModel dataPlan;
  final bool isSelected;
  const PackageItem(
      {super.key,
      required this.dataPlan,
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
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              dataPlan.name.toString(),
              style: blackText.copyWith(fontSize: 32, fontWeight: medium),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(Utils.formatCurrency(dataPlan.price ?? 0), style: greyText.copyWith(
              fontSize: 12, fontWeight: regular
            ),)
          ],
        ),
      ),
    );
  }
}
