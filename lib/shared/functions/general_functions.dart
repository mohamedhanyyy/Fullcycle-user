import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GeneralFunctions {
  static unFocusCursorRTL(TextEditingController controller) {
    if (controller.selection ==
        TextSelection.fromPosition(
            TextPosition(offset: controller.text.length - 1))) {
      controller.selection = TextSelection.fromPosition(
          TextPosition(offset: controller.text.length));
    }
  }

  static void hideKeyboard() {
    if (FocusManager.instance.primaryFocus?.hasFocus == true) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  static setPreferredOrientation() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }
}
