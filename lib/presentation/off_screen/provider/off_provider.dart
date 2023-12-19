import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/off_screen/models/off_model.dart';

/// A provider class for the OffScreen.
///
/// This provider manages the state of the OffScreen, including the
/// current offModelObj

// ignore_for_file: must_be_immutable
class OffProvider extends ChangeNotifier {
  OffModel offModelObj = OffModel();

  @override
  void dispose() {
    super.dispose();
  }
}
