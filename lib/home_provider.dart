import 'dart:developer';

import 'package:fcm_testing/notification_model.dart';
import 'package:flutter/cupertino.dart';

import 'api_services.dart';

enum ApiResponseSates { SUCCESS, WRONG_TOKEN, WRONG_KEY, NONE }

extension CurrentMethod on StackTrace {
  String get currentMethod => toString();
}

class HomeProvider with ChangeNotifier {
  bool _isLoading = false;
  ApiResponseSates _apiResponseSates = ApiResponseSates.NONE;
  String _token = "";
  String _serverKey = "";

  bool get isLoading => _isLoading;
  ApiResponseSates get apiResponseSates => _apiResponseSates;
  String get token => _token;
  String get serverKey => _serverKey;

  void onTokenChanged(String val) {
    if (val.isEmpty) {
      return;
    }

    _token = val;
    notifyListeners();
  }

  void onServerKeyChanged(String val) {
    log(StackTrace.current.currentMethod);

    if (val.isEmpty) {
      return;
    }

    _serverKey = val;
    notifyListeners();
  }

  void validateQuickFcmTest() {
    log(StackTrace.current.currentMethod);

    if (_token.isNotEmpty && _serverKey.isNotEmpty) {
      sendNotification();
    }
  }

  sendNotification() async {
    log(StackTrace.current.currentMethod);
    _isLoading = true;
    notifyListeners();

    NotificationObject notification = NotificationObject(
      title: "This is title of notification",
      body: "This is body of notification",
    );
    var data = {"data": "Custom data here"};

    NotificationBody body =
        NotificationBody(to: token, notification: notification, data: data);

    print(body.toString());
    print(body.toJson());

    var json = body.toJson();

    _isLoading = true;
    _apiResponseSates = await ApiServices.sendNotification(json, serverKey);

    notifyListeners();
  }
}
