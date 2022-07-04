part of 'main.dart';

class Global {
  static final Global instance = Global._();
  Global._();

  // GLOBAL VARs
  PackageInfo? _platform;

  Future<void> _initialize() async {
    _platform = await PackageInfo.fromPlatform();
  }

  // ACCESSIBLE
  bool get unitTest => Platform.environment.containsKey('FLUTTER_TEST');
  PackageInfo get platform {
    if (_platform == null) throw ErrorSummary("Required initialize [Global] in main()");
    return _platform!;
  }
}
