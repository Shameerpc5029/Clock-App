import 'package:clock_app/common/data/data.dart';
import 'package:clock_app/controller/manu_info_controller.dart';
import 'package:clock_app/model/manu_type_enum.dart';
import 'package:clock_app/screens/alarm/alarm_view.dart';
import 'package:clock_app/screens/clock/clock_view.dart';
import 'package:clock_app/screens/home/widgets/custom_button.dart';
import 'package:clock_app/screens/stopwatch/stopwatch_view.dart';
import 'package:clock_app/screens/timer/timer_view.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScrenn extends StatelessWidget {
  const HomeScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Center(
            child: Center(
              child: Row(
                children: [
                  SizedBox(
                    width: 90,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: menuItem
                          .map((currentMenuInfo) =>
                              buildMenuButton(context, currentMenuInfo))
                          .toList(),
                    ),
                  ),
                  const VerticalDivider(),
                  Expanded(
                    child: Consumer<MenuInfoCondroller>(
                      builder: (context, value, child) {
                        if (value.menuType == MenuType.clock) {
                          return const ClockView();
                        } else if (value.menuType == MenuType.alarm) {
                          return const AlarmView();
                        } else if (value.menuType == MenuType.timer) {
                          return const TimerView();
                        }
                        return const StopwatchView();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
