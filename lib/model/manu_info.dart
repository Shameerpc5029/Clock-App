import 'package:clock_app/model/manu_type_enum.dart';

import 'package:flutter/material.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title;
  IconData? iconData;
  Color? manuItemColor;

  MenuInfo(this.menuType, {this.title, this.iconData, this.manuItemColor});

  updateMenu(MenuInfo menuInfo) {
    menuType = menuInfo.menuType;
    title = menuInfo.title;
    iconData = menuInfo.iconData;
    manuItemColor = menuInfo.manuItemColor;

    notifyListeners();
  }
}
