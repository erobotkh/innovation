import 'package:flutter/foundation.dart';

class BaseViewModel extends ChangeNotifier {
  late bool disposed;

  BaseViewModel() {
    disposed = false;
  }

  @override
  void dispose() {
    disposed = true;
    super.dispose();
  }
}
