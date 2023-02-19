import 'package:clock_app/common/style/sizes.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.text,
    required this.color,
    required this.iconData,
    required this.onTap,
  });
  final void Function()? onTap;
  final String text;
  final Color color;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            Icon(
              iconData,
              color: color,
              size: 40,
            ),
            KSizedBox().height10,
            Text(
              text,
              style: Theme.of(context).textTheme.headlineLarge,
            )
          ],
        ),
      ),
    );
  }
}
