import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/red_screen/models/red_model.dart';

/// A provider class for the RedScreen.
///
/// This provider manages the state of the RedScreen, including the
/// current redModelObj

// ignore_for_file: must_be_immutable
class RedProvider extends ChangeNotifier {
  RedModel redModelObj = RedModel();

  @override
  void dispose() {
    super.dispose();
  }
}
