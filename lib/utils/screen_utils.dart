import 'package:flutter/widgets.dart';

class ScreenUtils {
  final BuildContext context;

  ScreenUtils(this.context);

  // Get the width of the screen
  double getScreenWidth() {
    return MediaQuery.of(context).size.width;
  }

  // Get the height of the screen
  double getScreenHeight() {
    return MediaQuery.of(context).size.height;
  }

  // Get the width of a widget as a percentage of the screen width
  double getWidgetWidth(double percentage) {
    return getScreenWidth() * percentage / 100;
  }

  // Get the height of a widget as a percentage of the screen height
  double getWidgetHeight(double percentage) {
    return getScreenHeight() * percentage / 100;
  }
}
