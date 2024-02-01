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
}

Future<XFile?> selectImage() async {
  XFile? selectedImage =
      await ImagePicker().pickImage(source: ImageSource.gallery);
  return selectedImage;
}
