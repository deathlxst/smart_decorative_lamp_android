import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/on_screen/models/on_model.dart';

/// A provider class for the OnScreen.
///
/// This provider manages the state of the OnScreen, including the
/// current onModelObj

// ignore_for_file: must_be_immutable
class OnProvider extends ChangeNotifier {
  OnModel onModelObj = OnModel();

  @override
  void dispose() {
    super.dispose();
  }
}
