import 'package:flutter/material.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Text(
            "Alarm",
          ),
        ],
      ),
    );
  }
}