import 'dart:math';

import 'package:flutter/material.dart';
import 'package:innovation/core/base/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  late final ValueNotifier<double?> minimumHeightNotifier;

  HomeViewModel() {
    minimumHeightNotifier = ValueNotifier<double?>(null);
  }

  @override
  void dispose() {
    minimumHeightNotifier.dispose();
    super.dispose();
  }

  void setCardSize(double height) {
    double nextValue = min(height, minimumHeightNotifier.value ?? height);
    if (nextValue != minimumHeightNotifier.value) {
      minimumHeightNotifier.value = nextValue;
    }
  }
}
