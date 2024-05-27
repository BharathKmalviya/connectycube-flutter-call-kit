// ignore_for_file: unrelated_type_equality_checks

import 'package:connectycube_flutter_call_kit/connectycube_flutter_call_kit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: callInitiate, child: Text("init call"))
            )
          ],
        ),
      ),
    );
  }

  void callInitiate() {
    checkFullScreenIntentPermission();

    CallEvent callEvent = CallEvent(
      sessionId: "sessionId",
      callType: 1,
      callerId: 123,
      callerName: 'John Doe',
      opponentsIds: {456, 789},
      callPhoto:
      'https://images.pexels.com/photos/8159657/pexels-photo-8159657.jpeg?auto=compress&cs=tinysrgb&w=600',
    );
    ConnectycubeFlutterCallKit.showCallNotification(callEvent);

    // Future.delayed(Duration(seconds: 0), () {
    //   print("call initiated after 2 seconds of button click");
    //
    // },);
  }

  void checkFullScreenIntentPermission() async {
    bool boolValue = await ConnectycubeFlutterCallKit.canUseFullScreenIntent();
    print("boolValue: $boolValue");
    if (boolValue == false) {
      ConnectycubeFlutterCallKit.provideFullScreenIntentAccess();
    }
  }
}
// https://github.com/flutter/flutter/blob/master/docs/platforms/android/Upgrading-pre-1.12-Android-projects.md
