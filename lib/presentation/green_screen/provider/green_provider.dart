import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/green_screen/models/green_model.dart';

/// A provider class for the GreenScreen.
///
/// This provider manages the state of the GreenScreen, including the
/// current greenModelObj

// ignore_for_file: must_be_immutable
class GreenProvider extends ChangeNotifier {
  GreenModel greenModelObj = GreenModel();

  @override
  void dispose() {
    super.dispose();
  }
}
