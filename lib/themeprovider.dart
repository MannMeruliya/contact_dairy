import 'package:flutter/material.dart';

class Themeprovider extends ChangeNotifier {
  late bool _isDark;

  Themeprovider() {
    _isDark = false;
  }

  bool get isDark => _isDark;

  set isDark(bool value) {
    _isDark = value;
    notifyListeners();
  }
}
