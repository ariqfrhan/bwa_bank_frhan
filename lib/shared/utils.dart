import 'package:bwa_bank_frhan/shared/theme.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Utils {
  static void getSnackBar(String message) {
    Get.showSnackbar(GetSnackBar(
      snackPosition: SnackPosition.TOP,
      snackStyle: SnackStyle.GROUNDED,
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: pinkColor,
    ));
  }

  static String formatCurrency(int amount, {String symbol = 'Rp'}) {
    return NumberFormat.currency(locale: 'id', symbol: symbol, decimalDigits: 0)
        .format(amount);
  }

  static String formatCardNumber(String cardNumber) {
    String clean = cardNumber.replaceAll(" ", "");

    return clean.replaceAllMapped(
        RegExp(r".{4}"), (Match match) => "${match.group(0)} ");
  }

  static String setTransactionThumbnail(String code){
    switch (code) {
      case 'top_up':
        return 'assets/ic_transaction_category1.png';
      case 'transfer':
        return 'assets/ic_transaction_category4.png';
      case 'receive':
        return 'assets/ic_transaction_category1.png';
      case 'withdraw':
        return 'assets/ic_transaction_category2.png';
      case 'buy':
        return 'assets/ic_transaction_category5.png';
      default:
        return 'assets/ic_transaction_category1.png';
    }
  }
}

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImage;
}
