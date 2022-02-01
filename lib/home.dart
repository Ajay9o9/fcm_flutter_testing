import 'package:fcm_testing/api_services.dart';
import 'package:fcm_testing/glassmorphism.dart';
import 'package:fcm_testing/notification_model.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String toToken = "";

  final quickTokenController = TextEditingController();
  final quickFirebaseServerKeyToken = TextEditingController();
  final customTokenController = TextEditingController();
  final customFirebaseServerKeyToken = TextEditingController();
  final notificationTitleController = TextEditingController();
  final notificationBodyController = TextEditingController();
  final notificationDataController = TextEditingController();

  bool _isTokenWrong = false;

  void sendNotification() {
    NotificationBody body = NotificationBody();
  }

  void sendQuickNotification() async {
    String token = quickTokenController.value.text;
    String serverKey = quickFirebaseServerKeyToken.value.text;

    _isTokenWrong = token.length < 130;
    setState(() {});

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

    ApiResponseSates apiResponseSates =
        await ApiServices.sendNotification(json, serverKey);
    print(apiResponseSates);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Center(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          clipBehavior: Clip.hardEdge,
          elevation: 20,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.lightBlue.shade600,
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Column(
                        children: [
                          Text(
                            "EXAMPLE  PAYLOAD",
                            style: TextStyle(
                                fontSize: 26,
                                color: Colors.white,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          // Container(
                          //   height: 200,
                          //   child: GlassMorphism(
                          //     start: .21,
                          //     end: .64,
                          //     child: Padding(
                          //       padding: const EdgeInsets.symmetric(
                          //           horizontal: 8.0, vertical: 16),
                          //       child: Scrollbar(
                          //         isAlwaysShown: true,
                          //         child: SingleChildScrollView(
                          //           child: SelectableText(
                          //             jsonExample,
                          //             showCursor: true,
                          //             cursorColor: Colors.red,
                          //             toolbarOptions: ToolbarOptions(
                          //                 copy: true,
                          //                 selectAll: true,
                          //                 cut: false,
                          //                 paste: false),
                          //             style: TextStyle(
                          //               fontSize: 13,
                          //               color: Colors.blueGrey[800],
                          //               fontWeight: FontWeight.w900,
                          //               wordSpacing: 1,
                          //             ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          TextFormField(
                            controller: quickTokenController,
                            decoration: InputDecoration(
                              labelText: 'Enter Firebase server key',
                              labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              // border: UnderlineInputBorder(),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          TextFormField(
                            controller: quickFirebaseServerKeyToken,
                            decoration: InputDecoration(
                              labelText: 'Enter Firebase device token',
                              labelStyle: TextStyle(color: Colors.black),
                              filled: true,
                              // border: UnderlineInputBorder(),
                              border: InputBorder.none,
                              fillColor: Colors.white,
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          Center(
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              child: ElevatedButton(
                                  onPressed: sendQuickNotification,
                                  style: ElevatedButton.styleFrom(
                                      // fixedSize: Size(300, 50),
                                      primary: Colors.lightBlue[50]),
                                  child: Text(
                                    "Quick Try ",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.lightBlue[800]),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                                child: Text(
                              "Send New Notification",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            )),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: customFirebaseServerKeyToken,
                              decoration: InputDecoration(
                                labelText: 'Enter Firebase server key',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: customTokenController,
                              decoration: InputDecoration(
                                labelText: 'Enter Firebase device token',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Notification Data"),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: notificationTitleController,
                              decoration: InputDecoration(
                                labelText: 'Enter Notification title',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              controller: notificationBodyController,
                              decoration: InputDecoration(
                                labelText: 'Enter Notificaion body',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text("Data Payload"),
                            SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              maxLines: 2,
                              showCursor: true,
                              enabled: true,
                              controller: notificationDataController,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                labelText: 'Enter booking data as json',
                                filled: true,
                                border: OutlineInputBorder(),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: Container(
                                width: double.infinity,
                                height: 60,
                                child: ElevatedButton(
                                    onPressed: sendNotification,
                                    style: ElevatedButton.styleFrom(
                                        // fixedSize: Size(300, 50),
                                        primary: Colors.lightBlue[900]),
                                    child: Text(
                                      "Send Notification",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(fontSize: 22),
                                    )),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
