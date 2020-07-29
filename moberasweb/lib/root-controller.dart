import 'package:flutter/material.dart';
import 'package:moberasweb/get_state.dart';
import 'package:moberasweb/parse_arguments.dart';

class GetMaterialController extends GetController {
  ParseRoute parse = ParseRoute();
  Key key;
  ThemeData theme;
  ThemeMode themeMode;

  void setTheme(ThemeData value) {
    theme = value;
    update();
  }

  void setThemeMode(ThemeMode value) {
    themeMode = value;
    update();
  }

  void restartApp() {
    key = UniqueKey();
    update();
  }
}
