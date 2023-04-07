import 'package:clock_app/common/style/theme.dart';
import 'package:clock_app/controller/home_controller.dart';

import 'package:clock_app/model/manu_info.dart';
import 'package:clock_app/model/manu_type_enum.dart';
import 'package:clock_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();

  var initializationSettingsAndroid =
      const AndroidInitializationSettings('clock_logo');
  final initializationSettingsIOS = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification:
          (int id, String? title, String? body, String? payload) async {});
  final initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
    iOS: initializationSettingsIOS,
  );

  await flutterLocalNotificationsPlugin.initialize(
    initializationSettings,
    onDidReceiveNotificationResponse:
        (NotificationResponse notificationResponse) async {},
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme(),
        theme: lightTheme(),
        themeMode: ThemeMode.system,
        home: ChangeNotifierProvider<MenuInfo>(
          create: (context) => MenuInfo(MenuType.clock),
          child: const HomeScrenn(),
        ),
      ),
    );
  }
}
