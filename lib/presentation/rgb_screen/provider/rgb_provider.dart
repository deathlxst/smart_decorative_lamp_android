import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/rgb_screen/models/rgb_model.dart';

/// A provider class for the RgbScreen.
///
/// This provider manages the state of the RgbScreen, including the
/// current rgbModelObj

// ignore_for_file: must_be_immutable
class RgbProvider extends ChangeNotifier {
  RgbModel rgbModelObj = RgbModel();

  @override
  void dispose() {
    super.dispose();
  }
}
