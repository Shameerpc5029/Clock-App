import 'dart:math';

import 'package:flutter/material.dart';

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
    canvas.drawCircle(center, radius - 50, fillBrush);

    //**********  Outline ******************/
    var outlineBrush = Paint()
      ..color = const Color(0xffeaecff)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12;
    canvas.drawCircle(center, radius - 50, outlineBrush);

    //**********  Sec arrow ******************/

    var secHandBrush = Paint()
      ..color = Colors.orange[300]!
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    var secHandX = centerX + 75 * cos(dateTime.second * 6 * pi / 180);
    var secHandY = centerX + 75 * sin(dateTime.second * 6 * pi / 180);

    canvas.drawLine(center, Offset(secHandX, secHandY), secHandBrush);

    //**********  Minit arrow ******************/

    var minHandBrush = Paint()
      ..shader =
          const RadialGradient(colors: [Color(0xff748ef6), Color(0xff77ddff)])
              .createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 8;

    var minHandX = centerX + 60 * cos(dateTime.minute * 6 * pi / 180);
    var minHandY = centerX + 60 * sin(dateTime.minute * 6 * pi / 180);

    canvas.drawLine(center, Offset(minHandX, minHandY), minHandBrush);

    //**********  hour arrow ******************/
    var hourHandBrush = Paint()
      ..shader = const RadialGradient(
        colors: [
          Color(0xffea74ab),
          Color(0xffc279fb),
        ],
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 10;

    var hourHandX = centerX +
        50 * cos((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);
    var hourHandY = centerX +
        50 * sin((dateTime.hour * 30 + dateTime.minute * .5) * pi / 180);

    canvas.drawLine(center, Offset(hourHandX, hourHandY), hourHandBrush);

    //**********  center Dot ******************/
    var centerDotBrush = Paint()..color = const Color(0xffeaecff);

    canvas.drawCircle(center, 14, centerDotBrush);

    //**********  Outer lines ******************/

    var dashBrush = Paint()
      ..color = const Color(0xFFEAECFF)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;
    var outerRadius = radius - 30;
    var innerRadius = radius * .9;
    for (double i = 0; i < 360; i += 12) {
      var x1 = centerX + outerRadius * cos(i * pi / 180);
      var y1 = centerY + outerRadius * sin(i * pi / 180);
      var x2 = centerX + innerRadius * cos(i * pi / 180);
      var y2 = centerY + innerRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
