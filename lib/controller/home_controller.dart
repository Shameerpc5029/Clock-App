import 'dart:async';

import 'package:clock_app/db/alarm_helper.dart';
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

  AlarmHelper? helper;

  void onPressedDeleteAlarm(id) {
    helper?.delete(id);
    notifyListeners();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }
}
