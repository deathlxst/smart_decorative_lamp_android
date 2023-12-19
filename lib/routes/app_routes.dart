import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/presentation/off_screen/off_screen.dart';
import 'package:stefanus_s_application1/presentation/on_screen/on_screen.dart';
import 'package:stefanus_s_application1/presentation/orange_screen/orange_screen.dart';
import 'package:stefanus_s_application1/presentation/yellow_screen/yellow_screen.dart';
import 'package:stefanus_s_application1/presentation/purple_screen/purple_screen.dart';
import 'package:stefanus_s_application1/presentation/red_screen/red_screen.dart';
import 'package:stefanus_s_application1/presentation/blue_screen/blue_screen.dart';
import 'package:stefanus_s_application1/presentation/green_screen/green_screen.dart';
import 'package:stefanus_s_application1/presentation/rgb_screen/rgb_screen.dart';
import 'package:stefanus_s_application1/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String offScreen = '/off_screen';

  static const String onScreen = '/on_screen';

  static const String orangeScreen = '/orange_screen';

  static const String yellowScreen = '/yellow_screen';

  static const String purpleScreen = '/purple_screen';

  static const String redScreen = '/red_screen';

  static const String blueScreen = '/blue_screen';

  static const String greenScreen = '/green_screen';

  static const String rgbScreen = '/rgb_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String initialRoute = '/initialRoute';

  static Map<String, WidgetBuilder> get routes => {
        offScreen: OffScreen.builder,
        onScreen: OnScreen.builder,
        orangeScreen: OrangeScreen.builder,
        yellowScreen: YellowScreen.builder,
        purpleScreen: PurpleScreen.builder,
        redScreen: RedScreen.builder,
        blueScreen: BlueScreen.builder,
        greenScreen: GreenScreen.builder,
        rgbScreen: RgbScreen.builder,
        appNavigationScreen: AppNavigationScreen.builder,
        initialRoute: OffScreen.builder
      };
}
