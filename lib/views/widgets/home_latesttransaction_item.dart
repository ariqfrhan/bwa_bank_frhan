import 'package:bwa_bank_frhan/models/transaction_model.dart';
import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:bwa_bank_frhan/shared/utils.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class LatestTransactionItem extends StatelessWidget {
  final TransactionModel transaction;
  const LatestTransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 18),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            Utils.setTransactionThumbnail(transaction.transactionType!.code!),
            width: 48,
          ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  transaction.transactionType!.name.toString(),
                  style: blackText.copyWith(fontWeight: medium, fontSize: 16),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  DateFormat('MMM dd')
                      .format(transaction.createdAt ?? DateTime.now()),
                  style: greyText.copyWith(fontSize: 12),
                )
              ],
            ),
          ),
          Text(
            Utils.formatCurrency(transaction.amount ?? 0,
                symbol: transaction.transactionType!.action == 'cr'
                    ? '+ Rp'
                    : '- Rp'),
            style: blackText.copyWith(fontWeight: medium, fontSize: 16),
          )
        ],
      ),
    );
  }
}
