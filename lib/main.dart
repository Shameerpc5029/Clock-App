import 'package:clock_app/common/style/theme.dart';
import 'package:clock_app/controller/home_controller.dart';
import 'package:clock_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
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
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        darkTheme: darkTheme(),
        theme: lightTheme(),
        themeMode: ThemeMode.system,
        home: const HomeScrenn(),
      ),
    );
  }
}
