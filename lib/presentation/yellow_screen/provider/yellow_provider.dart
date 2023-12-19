import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/yellow_screen/models/yellow_model.dart';

/// A provider class for the YellowScreen.
///
/// This provider manages the state of the YellowScreen, including the
/// current yellowModelObj

// ignore_for_file: must_be_immutable
class YellowProvider extends ChangeNotifier {
  YellowModel yellowModelObj = YellowModel();

  @override
  void dispose() {
    super.dispose();
  }
}
