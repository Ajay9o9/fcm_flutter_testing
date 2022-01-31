import 'dart:convert';
import 'dart:io';

import 'package:fcm_testing/notification_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static void sendNotification(Map body, String serverKey) async {
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

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
