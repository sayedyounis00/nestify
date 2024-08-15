import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nestify/core/helper/paymob/constant.dart';

class PaymentManager {
  Dio dio = Dio();

  Future<String> payWithPayMob({required int amount}) async {
    try {
      String mainToken = await getMainToken();
      log(mainToken);
      String url = await getUrlLink(mainToken);
      log(url);
      return url;
    } catch (e) {
      rethrow;
    }
  }

//! first function to get token
  Future<String> getMainToken() async {
    try {
      Response response = await dio.post(
          'https://accept.paymob.com/api/auth/tokens',
          options: Options(method: 'POST'),
          data: {
            "api_key": kApiKey,
          });
      return response.data['token'];
    } catch (e) {
      rethrow;
    }
  }

  Future<String> getUrlLink(String mainToken) async {
    try {
      var headers = {'Authorization': 'Bearer $mainToken'};
      var data = FormData.fromMap({
        'amount_cents': '100050',
        'payment_methods': '4630175',
        'full_name': 'ahmed',
        'email': 'ymahmoud1213@gmail.com',
        'phone_number': '+201014502276'
      });

      var dio = Dio();
      var response = await dio.request(
        'https://accept.paymob.com/api/ecommerce/payment-links',
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      return response.data['client_url'];
    } catch (e) {
      rethrow;
    }
  }
}
