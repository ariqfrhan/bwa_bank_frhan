import 'dart:convert';

import 'package:bwa_bank_frhan/models/operatorcard_model.dart';
import 'package:bwa_bank_frhan/services/auth_services.dart';
import 'package:bwa_bank_frhan/shared/values.dart';
import 'package:http/http.dart' as http;

class OperatorCardServices {
  Future<List<OperatorCardModel>> getOperatorCards() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(Uri.parse('$baseUrl/operator_cards'),
          headers: {'Authorization': token});

      if (res.statusCode == 200) {
        return List<OperatorCardModel>.from(jsonDecode(res.body)['data']
            .map((operator) => OperatorCardModel.fromJson(operator))
            .toList());
      } else {
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
