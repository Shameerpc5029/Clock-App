import 'dart:async';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  DateTime dateTime = DateTime.now();
  late Timer timer;

  void clock() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime = DateTime.now();

      notifyListeners();
    });
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
