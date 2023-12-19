import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/blue_screen/models/blue_model.dart';

/// A provider class for the BlueScreen.
///
/// This provider manages the state of the BlueScreen, including the
/// current blueModelObj

// ignore_for_file: must_be_immutable
class BlueProvider extends ChangeNotifier {
  BlueModel blueModelObj = BlueModel();

  @override
  void dispose() {
    super.dispose();
  }
}
