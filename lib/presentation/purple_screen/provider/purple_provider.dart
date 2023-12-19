import 'package:flutter/material.dart';
import 'package:stefanus_s_application1/core/app_export.dart';
import 'package:stefanus_s_application1/presentation/purple_screen/models/purple_model.dart';

/// A provider class for the PurpleScreen.
///
/// This provider manages the state of the PurpleScreen, including the
/// current purpleModelObj

// ignore_for_file: must_be_immutable
class PurpleProvider extends ChangeNotifier {
  PurpleModel purpleModelObj = PurpleModel();

  @override
  void dispose() {
    super.dispose();
  }
}
