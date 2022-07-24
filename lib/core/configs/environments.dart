library environment;

part 'package:innovation/constants/api_constant.dart';

class Environments {
  final String env;
  final String baseUrl;

  Environments({
    required this.env,
    required this.baseUrl,
  });

  static const String production = 'prod';
  static const String local = 'local';
  static const String dev = 'dev';

  static const String _currentEnvironments = _ApiConstant.env;
  static final List<Environments> _availableEnvironments = [
    Environments(
      env: Environments.production,
      baseUrl: 'http://localhost:3000',
    ),
    Environments(
      env: Environments.dev,
      baseUrl: _ApiConstant.baseUrl,
    ),
    Environments(
      env: Environments.local,
      baseUrl: _ApiConstant.baseUrl,
    )
  ];

  static Environments getEnv() {
    return _availableEnvironments.firstWhere(
      (d) => d.env == _currentEnvironments,
    );
  }
}
