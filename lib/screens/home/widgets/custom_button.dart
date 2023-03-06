import 'package:clock_app/common/style/colors.dart';
import 'package:clock_app/common/style/sizes.dart';
import 'package:clock_app/controller/manu_info_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Widget buildMenuButton(
    BuildContext context, MenuInfoCondroller currentMenuInfo) {
  return Consumer<MenuInfoCondroller>(
    builder: (context, value, child) {
      return InkWell(
        borderRadius: const BorderRadius.only(topRight: Radius.circular(20)),
        onTap: () {
          var manuInfo =
              Provider.of<MenuInfoCondroller>(context, listen: false);
          manuInfo.updateManu(currentMenuInfo);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.only(topRight: Radius.circular(20)),
            color: currentMenuInfo.menuType == value.menuType
                ? AppColors.shadowColor
                : Colors.transparent,
          ),
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            children: [
              Icon(
                currentMenuInfo.icon,
                color: currentMenuInfo.color,
                size: 40,
              ),
              KSizedBox().height10,
              Text(
                currentMenuInfo.title.toString(),
                style: Theme.of(context).textTheme.headlineLarge,
              )
            ],
          ),
        ),
      );
    },
  );
}
