import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:nestify/core/helper/paymob/constant.dart';

class PaymentManager {
  Dio dio = Dio();

  Future<String> payWithPayMob({required int amount}) async {
    try {
      String token = await getToken();
      int orderId =
          await getOrderId(token: token, amount: (100 * amount).toString());
      String paymentKey = await getPaymentKey(
          token: token,
          orderId: orderId.toString(),
          amount: (100 * amount).toString());
      return paymentKey;
    } catch (e) {
      rethrow;
    }
  }
//! first function to get token
  Future<String> getToken() async {
    try {
      Response response =
          await dio.post(
            'https://pakistan.paymob.com/api/auth/tokens',
           data: {
        "api_key":kApiKey,
        
      });
      return response.data['token'];
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }
//! second function to getorder id 
  Future<int> getOrderId(
      {required String token, required String amount}) async {
    try {
      Response response = await dio
          .post('https://pakistan.paymob.com/api/ecommerce/orders', data: {
        'auth_token': token,
        'delivery_needed': true,
        'amount_cents': amount,
        'currency': 'EGP',
        'items': [],
      });
      return response.data['id'];
    } catch (e) {
      rethrow;
    }
  }
  //! third function to return payment token 
  Future<String> getPaymentKey(
      {required String token, String? orderId, required String amount}) async {
    try {
      //! GE USER INFO METHOD
      Response response = await dio
          .post('https://pakistan.paymob.com/api/acceptance/payment_keys', data: {
        'auth_token': token,
        'amount_cents': amount,
        'currency': 'EGP',
        'integration_id': 1,
        'order_id': orderId,
        //!some data here will change to our renter data
        "billing_data": {
          "apartment": "NA",
          "email": "sayed34@exa.com",
          "floor": "NA",
          "first_name": "sayed",
          "street": "Ethan Land",
          "building": "8028",
          "phone_number": "+86(8)9135210487",
          "shipping_method": "PKG",
          "postal_code": "01898",
          "city": "Jaskolskiburgh",
          "country": "CR",
          "last_name": "seif",
          "state": "NA"
        },
      });
      return response.data['token'];
    } catch (e) {
      rethrow;
    }
  }
}
