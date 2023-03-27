import 'package:clock_app/model/alarm_info.dart';
import 'package:clock_app/model/manu_info.dart';
import 'package:clock_app/model/manu_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<MenuInfo> menuItems = [
  MenuInfo(MenuType.clock,
      title: 'Clock',
      iconData: CupertinoIcons.clock,
      manuItemColor: Colors.amber),
  MenuInfo(MenuType.alarm,
      title: 'Alarm',
      iconData: CupertinoIcons.alarm,
      manuItemColor: Colors.red),
  MenuInfo(MenuType.timer,
      title: 'Timer',
      iconData: CupertinoIcons.timer,
      manuItemColor: Colors.blue),
  MenuInfo(MenuType.stopwatch,
      title: 'Stopwatch',
      iconData: CupertinoIcons.stopwatch,
      manuItemColor: Colors.green),
];

List<AlarmInfo> alarms = [
  AlarmInfo(
      alarmDateTime: DateTime.now().add(const Duration(hours: 1)),
      title: 'Office',
      gradientColorIndex: 0),
  AlarmInfo(
      alarmDateTime: DateTime.now().add(const Duration(hours: 2)),
      title: 'Sport',
      gradientColorIndex: 1),
];
