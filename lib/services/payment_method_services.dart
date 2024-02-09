import 'dart:convert';

import 'package:bwa_bank_frhan/models/payment_method_model.dart';
import 'package:bwa_bank_frhan/services/auth_services.dart';
import 'package:bwa_bank_frhan/shared/values.dart';
import 'package:http/http.dart' as http;

class PaymentMethodServices {
  Future<List<PaymentMethodModel>> getPaymentMethod() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(Uri.parse('$baseUrl/payment_methods'),
          headers: {'Authorization': token});

      if (res.statusCode == 200) {
        return List<PaymentMethodModel>.from(jsonDecode(res.body)
            .map((paymentMethod) => PaymentMethodModel.fromJson(paymentMethod))
            .toList());
      }else{
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
