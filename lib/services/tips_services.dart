import 'dart:convert';

import 'package:bwa_bank_frhan/models/tips_model.dart';
import 'package:bwa_bank_frhan/services/auth_services.dart';
import 'package:bwa_bank_frhan/shared/values.dart';
import 'package:http/http.dart' as http;

class TipsServices {
  Future<List<TipsModel>> getTips() async {
    try {
      final token = await AuthServices().getToken();

      final res = await http.get(
        Uri.parse('$baseUrl/tips'),
        headers: {'Authorization': token},
      );

      if (res.statusCode == 200) {
        return List<TipsModel>.from(
          jsonDecode(res.body)['data'].map(
            (tip) => TipsModel.fromJson(tip),
          ),
        ).toList();
      } else {
        return jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
