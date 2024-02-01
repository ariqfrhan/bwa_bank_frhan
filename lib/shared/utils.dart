import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Utils {
  static GetSnackBar getSnackBar(String message) {
    return GetSnackBar(
      message: message,
      duration: const Duration(seconds: 2),
    );
  }

  static String formatCurrency(int amount, {String symbol = 'Rp'}){
    return NumberFormat.currency(
      locale: 'id',
      symbol: symbol,
      decimalDigits: 0
    ).format(amount);
  }
}
