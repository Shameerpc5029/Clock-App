import 'package:clock_app/model/manu_type_enum.dart';
import 'package:flutter/material.dart';

class MenuInfoCondroller extends ChangeNotifier {
  MenuType menuType;
  String? title;
  IconData? icon;
  Color? color;

  MenuInfoCondroller(this.menuType, {this.title, this.icon, this.color});
  void updateManu(MenuInfoCondroller menuInfoCondroller) {
    menuType = menuInfoCondroller.menuType;
    title = menuInfoCondroller.title;
    icon = menuInfoCondroller.icon;
    notifyListeners();
  }
}
