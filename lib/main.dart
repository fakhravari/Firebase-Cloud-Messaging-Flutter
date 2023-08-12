import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_application_1/firebase_options.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> requestPermission() async {
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final messaging = FirebaseMessaging.instance;

  await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: true,
    sound: true,
  );

  String? token;

  try {
    token = await messaging.getToken();
    print('token:${token!}');
  } catch (e) {
    token = null;
  }

  if (token != null && token != '') {
    // send api save db token
  }

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    // اپ باز باشه
    if (message.data.isNotEmpty) {
      LocalNotification(
          message.data['title'], message.data['body'], message.data['payload']);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    // RemoteNotification? notification = message.notification;
    // کیک بر روی نوتیفیکیشن در تولبار = اپ باز نباشد
  });

  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final DarwinInitializationSettings initializationSettingsDarwin =
      DarwinInitializationSettings(
    requestSoundPermission: true,
    requestBadgePermission: true,
    requestAlertPermission: true,
    onDidReceiveLocalNotification: (id, title, body, payload) async {
      if (title != null && title != '') {
        // title, body!
      }
    },
  );

  final InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin);

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse: (details) {
      // کیک بر روی نوتیفیکیشن در تولبار = اپ باز باشد
    },
  );
}

Future LocalNotification(title, body, payload) async {
  var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      'your channel id', 'your channel name',
      icon: '@mipmap/ic_launcher',
      playSound: true,
      importance: Importance.max,
      priority: Priority.high);
  var iOSPlatformChannelSpecifics =
      const DarwinNotificationDetails(presentSound: true);
  var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  await flutterLocalNotificationsPlugin
      .show(0, title, body, platformChannelSpecifics, payload: payload);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await requestPermission();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.ltr,
        child: Scaffold(
            body: SafeArea(
                child: Column(
          children: [
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    LocalNotification('تست', 'local Notification', '');
                  },
                  child: const Text('click')),
            )
          ],
        ))));
  }
}
