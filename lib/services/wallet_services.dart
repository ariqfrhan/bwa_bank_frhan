import 'dart:convert';

import 'package:bwa_bank_frhan/services/auth_services.dart';
import 'package:bwa_bank_frhan/shared/values.dart';
import 'package:http/http.dart' as http;

class WalletServices{
  Future<void> updatePin(String oldpin, String newpin) async{
    try {
      final token = await AuthServices().getToken();

      final res = await http.put(
          Uri.parse('$baseUrl/wallets'),
          body: {
            'previous_pin' : oldpin,
            'new_pin' : newpin
          }, 
          headers: {
            'Authorization': token
            }
          );

      if (res.statusCode != 200) {
        throw jsonDecode(res.body)['message'];
      }
      
    } catch (e) {
      rethrow;
    }
  }
}