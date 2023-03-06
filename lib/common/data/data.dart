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
