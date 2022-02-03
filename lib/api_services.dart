import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:fcm_testing/home_provider.dart';
import 'package:fcm_testing/notification_model.dart';
import 'package:http/http.dart' as http;


class ApiServices {
  static Future<ApiResponseSates> sendNotification(
      Map body, String serverKey) async {
    var url = Uri.parse('https://fcm.googleapis.com/fcm/send');

    print(jsonEncode(body));

    var response = await http.post(
      url,
      body: jsonEncode(body),
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
        HttpHeaders.acceptHeader: 'application/json',
        HttpHeaders.authorizationHeader: 'Key=$serverKey',
      },
    );

    log(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      if (data['success'] == 1) return ApiResponseSates.SUCCESS;
      return ApiResponseSates.WRONG_TOKEN;
    } else {
      return ApiResponseSates.WRONG_KEY;
    }

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
