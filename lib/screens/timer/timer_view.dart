import 'package:flutter/material.dart';

class TimerView extends StatelessWidget {
  const TimerView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Text(
            "Timer",
          ),
        ],
      ),
    );
  }
}
