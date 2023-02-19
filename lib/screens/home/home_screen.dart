import 'package:clock_app/screens/home/widgets/clock_view.dart';
import 'package:clock_app/screens/home/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScrenn extends StatelessWidget {
  const HomeScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Center(
            child: Row(
              children: [
                SizedBox(
                  width: 90,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: 'Clock',
                        color: Colors.orange,
                        iconData: CupertinoIcons.clock,
                        onTap: () {},
                      ),
                      CustomButton(
                        text: 'Alarm',
                        color: Colors.red,
                        iconData: CupertinoIcons.alarm,
                        onTap: () {},
                      ),
                      CustomButton(
                        text: 'Timer',
                        color: Colors.blue,
                        iconData: CupertinoIcons.timer,
                        onTap: () {},
                      ),
                      CustomButton(
                        text: 'Stopwatch',
                        color: Colors.green,
                        iconData: CupertinoIcons.stopwatch,
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const VerticalDivider(),
                const Expanded(
                  child: ClockView(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}