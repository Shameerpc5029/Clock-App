import 'dart:math';

import 'package:clock_app/common/style/sizes.dart';
import 'package:clock_app/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ClockView extends StatelessWidget {
  const ClockView({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).clock();
    });
    return Consumer<HomeController>(
      builder: (context, value, child) {
        return SingleChildScrollView(
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                top: -100,
                right: 180,
                child: Row(
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
              ),
              Column(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // KSizedBox().height30,

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "${value.dateTime.hour}:${value.dateTime.minute}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 60,
                        ),
                      ),
                      KSizedBox().width5,
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Text(
                          "${value.dateTime.second}",
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
                  KSizedBox().height10,
                  const Divider(
                    endIndent: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        const Text("Automatic timezone"),
                        const Spacer(),
                        Switch(
                          value: true,
                          onChanged: (value) {},
                        )
                      ],
                    ),
                  ),
                  // Spacer()
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}

class ClockPainter extends CustomPainter {
  final DateTime dateTime;

  ClockPainter(this.dateTime);
  @override
  void paint(Canvas canvas, Size size) {
    var centerX = size.width / 2;
    var centerY = size.height / 2;
    var center = Offset(centerX, centerY);
    var radius = min(centerX, centerY);

    //**********  Fill  ******************/
    var fillBrush = Paint()..color = const Color(0xff444974);
    canvas.drawCircle(center, radius - 40, fillBrush);

    //**********  Outline ******************/
    var outlineBrush = Paint()
      ..color = const Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;
    canvas.drawCircle(center, radius - 40, outlineBrush);

    //**********  Sec arrow ******************/

    var secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var secHandX = centerX + 80 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 80 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    //**********  Minit arrow ******************/

    var minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xff748ef6), Color(0xff77ddff)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minHandX = centerX + 80 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 80 * sin(dateTime.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    //**********  hour arrow ******************/
    var hourHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xffea74ab), Color(0xffc279fb)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 12;

    var hourHandX = centerX +
        60 * cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    var hourHandY = centerX +
        60 * sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    //**********  center Dot ******************/
    var centerDotBrush = Paint()..color = const Color(0xffeaecff);

    canvas.drawCircle(center, 14, centerDotBrush);

    //**********  Outer lines ******************/

    // var dashBrush = Paint()
    //   ..color = const Color(0xFFEAECFF)
    //   ..style = PaintingStyle.stroke
    //   ..strokeCap = StrokeCap.round
    //   ..strokeWidth = 1;
    // var outerRadius = radius;
    // var innerRadius = radius - 14;
    // for (double i = 0; i < 360; i += 12) {
    //   var x1 = centerX + outerRadius * cos(i * pi / 180);
    //   var y1 = centerX + outerRadius * cos(i * pi / 180);

    //   var x2 = centerX + innerRadius * cos(i * pi / 180);
    //   var y2 = centerX + innerRadius * cos(i * pi / 180);

    //   canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    // }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
