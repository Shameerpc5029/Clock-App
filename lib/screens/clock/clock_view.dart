import 'dart:math';

import 'package:clock_app/common/style/sizes.dart';
import 'package:clock_app/controller/home_controller.dart';
import 'package:clock_app/screens/clock/widgets/clock_painter.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).clock();
    });
    return Consumer<HomeController>(
      builder: (context, value, child) {
        return SingleChildScrollView(
            child: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: size.size.height * -.15,
              child: Text(
                "Clock",
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${value.dateTime.day}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        color: Colors.red,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        " / ${value.dateTime.month} / ${value.dateTime.year}",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${value.dateTime.hour.toString().padLeft(2, '0')}:${value.dateTime.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 60,
                      ),
                    ),
                    KSizedBox().width5,
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: Text(
                        value.dateTime.second.toString().padLeft(2, '0'),
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.amber),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 300,
                  width: 300,
                  child: Transform.rotate(
                    angle: -pi / 2,
                    child: Consumer<HomeController>(
                      builder: (context, value, child) {
                        return CustomPaint(
                          painter: ClockPainter(value.dateTime),
                        );
                      },
                    ),
                  ),
                ),
                Text(
                  'Timezone',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                KSizedBox().height10,
                Text(
                  "UTC+${value.dateTime.timeZoneOffset}(${value.dateTime.timeZoneName})",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ],
        ));
      },
    );
  }
}
