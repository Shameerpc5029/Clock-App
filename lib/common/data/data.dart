import 'package:clock_app/common/style/colors.dart';
import 'package:clock_app/common/style/theme.dart';
import 'package:clock_app/controller/alarm_info.dart';
import 'package:clock_app/controller/manu_info_controller.dart';
import 'package:clock_app/model/manu_type_enum.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<MenuInfoCondroller> menuItem = [
  MenuInfoCondroller(
    MenuType.clock,
    title: 'Colck',
    icon: CupertinoIcons.clock,
    color: Colors.amber,
  ),
  MenuInfoCondroller(
    MenuType.alarm,
    title: 'Alarm',
    icon: CupertinoIcons.alarm,
    color: Colors.red,
  ),
  MenuInfoCondroller(
    MenuType.timer,
    title: 'Timer',
    icon: CupertinoIcons.timer,
    color: Colors.blue,
  ),
  MenuInfoCondroller(
    MenuType.stopwatch,
    title: 'Stopwatch',
    icon: CupertinoIcons.stopwatch,
    color: Colors.green,
  ),
];
List<AlarmInfo> alarms = [
  AlarmInfo(
    DateTime.now().add(
      const Duration(hours: 1),
    ),
    description: 'Office',
    gradientColors: GradientColors.sea,
  ),
  AlarmInfo(
    DateTime.now().add(
      const Duration(hours: 2),
    ),
    description: 'sports',
    gradientColors: GradientColors.fire,
  ),
];
