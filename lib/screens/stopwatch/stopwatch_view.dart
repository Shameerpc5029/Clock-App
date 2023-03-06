import 'package:flutter/material.dart';

class StopwatchView extends StatelessWidget {
  const StopwatchView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: const [
          Text(
            "Stopwatch",
          ),
        ],
      ),
    );
  }
}