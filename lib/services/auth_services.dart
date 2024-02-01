import 'dart:convert';

import 'package:bwa_bank_frhan/models/signup_form_model.dart';
import 'package:bwa_bank_frhan/models/user_model.dart';
import 'package:bwa_bank_frhan/shared/values.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http
          .post(Uri.parse('$baseUrl/is-email-exist'), body: {'email': email});

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
      } else {
        return jsonDecode(res.body)['errors'];
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<UserModel> register(SignupFormModel data) async {
    try {
      final res =
          await http.post(Uri.parse('$baseUrl/register'), body: data.toJson());

      if (res.statusCode == 200) {
        UserModel user = UserModel.fromJson(jsonDecode(res.body));
        user = user.copyWith(password: data.password);

        return user;
      }else{
        throw jsonDecode(res.body)['message'];
      }
    } catch (e) {
      rethrow;
    }
  }
}
