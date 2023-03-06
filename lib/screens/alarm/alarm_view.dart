import 'package:clock_app/common/data/data.dart';
import 'package:clock_app/common/style/colors.dart';
import 'package:clock_app/common/style/sizes.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlarmView extends StatelessWidget {
  const AlarmView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Alarm",
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView(
              physics: const ScrollPhysics(),
              children: alarms.map<Widget>((alarms) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 20),
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: alarms.gradientColors!,
                      begin: Alignment.bottomLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: alarms.gradientColors!.last.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(4, 4),
                      ),
                    ],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.label,
                            color: Colors.white,
                          ),
                          KSizedBox().width5,
                          Text(alarms.description.toString()),
                          const Spacer(),
                          Switch(
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            value: true,
                            onChanged: (value) {},
                            activeColor: Colors.white,
                          )
                        ],
                      ),
                      const Text("Mon-Fri"),
                      KSizedBox().height5,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "07:00",
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const Icon(
                            Icons.keyboard_arrow_down_outlined,
                            color: Colors.white,
                          )
                        ],
                      )
                    ],
                  ),
                );
              }).followedBy([
                DottedBorder(
                  color: AppColors.clockOutline,
                  strokeWidth: 1,
                  dashPattern: const [5],
                  strokeCap: StrokeCap.butt,
                  borderType: BorderType.RRect,
                  radius: const Radius.circular(24),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.clockBG,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      child: Column(
                        children: [
                          const Icon(
                            CupertinoIcons.add_circled,
                            color: Colors.white,
                            size: 40,
                          ),
                          KSizedBox().height10,
                          Text(
                            'Add Alarm',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ]).toList(),
            ),
          ),
        )
      ],
    );
  }
}
