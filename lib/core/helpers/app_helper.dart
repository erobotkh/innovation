class AppHelper {
  static String? queryParameters({
    required String url,
    required String param,
  }) {
    return Uri.parse(url).queryParameters[param];
  }
}
