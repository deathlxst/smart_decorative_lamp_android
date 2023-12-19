import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/orange_screen/models/orange_model.dart';

/// A provider class for the OrangeScreen.
///
/// This provider manages the state of the OrangeScreen, including the
/// current orangeModelObj

// ignore_for_file: must_be_immutable
class OrangeProvider extends ChangeNotifier {
  OrangeModel orangeModelObj = OrangeModel();

  @override
  void dispose() {
    super.dispose();
  }
}
