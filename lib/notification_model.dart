class NotificationBody {
  String? to;
  NotificationObject? notification;
  Map? data;

  NotificationBody({this.to, this.notification, this.data});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['to'] = this.to;
    if (this.notification != null) {
      data['notification'] = notification!.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data;
    }
    return data;
  }
}

class NotificationObject {
  String? title;
  String? body;
  bool? mutableContent;
  String? sound;

  NotificationObject({this.title, this.body, this.mutableContent, this.sound});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;

    return data;
  }
}
