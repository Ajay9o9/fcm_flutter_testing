import 'package:fcm_testing/api_services.dart';
import 'package:fcm_testing/glassmorphism.dart';
import 'package:fcm_testing/home_provider.dart';
import 'package:fcm_testing/notification_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String toToken = "";

  final quickTokenController = TextEditingController()
    ..text =
        "ef_XJNM0EEc4hq05Z1qooM:APA91bGfnops-iuWxJdLzNaFBTsH4t--vL5LgrUKfncWeOkVYdOFAqiG8luzF935e9ULhQs5qaOdRpD0-ST-BG9I554dq1UIlLKycDYR4hmlZe0IZ50rhTk3FDj5QlVyHS-Xw_FYFcWJ";
  final quickFirebaseServerKeyToken = TextEditingController()
    ..text =
        "AAAAbeLbUvs:APA91bFk56TrpkwoxhhL9M2q0vGNjdFGP93hE8mhQXppRTVaqZY9WxHVNbnXmoweRw-kNsOGzeRZUVJphB9J5QrgRKXNRbqvE_Cd_TaGI59PinwzFGmnm2uHt8j54syXve0vScFiizId";
  final customTokenController = TextEditingController();
  final customFirebaseServerKeyToken = TextEditingController();
  final notificationTitleController = TextEditingController();
  final notificationBodyController = TextEditingController();
  final notificationDataController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(builder: (context, homeProvider, _) {
      if (homeProvider.isLoading) {
        WidgetsBinding.instance?.addPostFrameCallback((duration) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              content: Center(child: const CircularProgressIndicator()),
            ),
          );
        });
      }

      if (homeProvider.apiResponseSates == ApiResponseSates.SUCCESS) {
        WidgetsBinding.instance?.addPostFrameCallback((duration) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("FCM Response"),
              content: const Text("Notification send succesfully"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("okay"),
                ),
              ],
            ),
          );
        });
      }

      if (homeProvider.apiResponseSates == ApiResponseSates.WRONG_KEY) {
        WidgetsBinding.instance?.addPostFrameCallback((duration) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("FCM Response"),
              content: const Text("Firebase Server Key entered is wrong"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("okay"),
                ),
              ],
            ),
          );
        });
      }

      if (homeProvider.apiResponseSates == ApiResponseSates.WRONG_TOKEN) {
        WidgetsBinding.instance?.addPostFrameCallback((duration) {
          showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
              title: Text("FCM Response"),
              content: const Text("Firebase Token is wrong"),
              actions: <Widget>[
                FlatButton(
                  onPressed: () {
                    Navigator.of(ctx).pop();
                  },
                  child: Text("okay"),
                ),
              ],
            ),
          );
        });
      }

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
                              onChanged: (val) {
                                homeProvider.onTokenChanged(val);
                              },
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
                              onChanged: (val) {
                                homeProvider.onServerKeyChanged(val);
                              },
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
                                    onPressed: () {
                                      homeProvider.validateQuickFcmTest();
                                    },
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
                                      onPressed: null,
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
    });
  }
}
