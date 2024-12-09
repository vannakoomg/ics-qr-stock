import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../local_data/storge_local.dart';

// import 'package:flutter_app_badger/flutter_app_badger.dart';

Future checkForInitalMessge() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseMessaging.instance.getInitialMessage().then((value) {
    if (value != null) {
      handleRoute(value);
    }
  });
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
    'high_importance_cannel', 'high Importance Notification',
    importance: Importance.high, playSound: true);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
int i = 0;
void listNotification() async {
  i = i + 2;
  FlutterAppBadger.updateBadgeCount(5);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  String? token = await messaging.getToken();
  debugPrint("device token $token");

  if (messaging.isAutoInitEnabled) {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      debugPrint("get messages");

      addNotification();
      RemoteNotification? notification = message.notification;
      if (message.notification != null) {
        if (Platform.isAndroid) {
          await flutterLocalNotificationsPlugin
              .resolvePlatformSpecificImplementation<
                  AndroidFlutterLocalNotificationsPlugin>()
              ?.createNotificationChannel(channel);
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification!.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                icon: '@mipmap/ic_launcher',
                importance: Importance.high,
              ),
              iOS: const DarwinNotificationDetails(),
            ),
          );
        }

        await flutterLocalNotificationsPlugin.initialize(
          const InitializationSettings(
            android: AndroidInitializationSettings('@mipmap/ic_launcher'),
            iOS: DarwinInitializationSettings(),
          ),
          onDidReceiveNotificationResponse:
              (NotificationResponse notificationResponse) {
            debugPrint("tap on notification $message");
            handleRoute(message);
          },
        );
      }
    });
    // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    //   handleRoute(message);
    // });
    FirebaseMessaging.onBackgroundMessage((message) async {
      debugPrint("88888888888");
      handleRoute(message);
    });
  } else {
    debugPrint('User declined or has not accepted permission');
  }
}

void handleRoute(RemoteMessage message) {
  // router.pushNamed(
  //   'question-detail',
  //   pathParameters: {"id": "109"},
  // );
}

void addNotification() async {
  try {
    int number = LocalStorage.getIntValue('numberNotificaiton');
    await LocalStorage.storeData(key: 'numberNotificaiton', value: number + 1);
  } catch (e) {
    debugPrint("catch $e");
  }
}

void subtractNotification() async {
  int number = LocalStorage.getIntValue('numberNotificaiton');
  await LocalStorage.storeData(key: 'numberNotificaiton', value: number - 1);
}

void countNotification() async {}