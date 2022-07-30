import 'package:innovation/core/helpers/app_helper.dart';
import 'package:innovation/core/models/commons/links_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("AppHelper.queryParameters", () {
    test("it return a value of selected params", () async {
      LinksModel link = LinksModel.fromJson({
        'self': "https://example.com?page=1",
        'next': "https://example.com?page=2",
        'prev': "https://example.com?page=3",
        'last': "https://example.com?page=4&price=1",
        'first': "https://example.com?per_page=12&page=5",
      });

      expect(AppHelper.queryParameters(url: link.self!, param: "page"), '1');
      expect(AppHelper.queryParameters(url: link.next!, param: "page"), '2');
      expect(AppHelper.queryParameters(url: link.prev!, param: "page"), '3');
      expect(AppHelper.queryParameters(url: link.last!, param: "page"), '4');
      expect(AppHelper.queryParameters(url: link.first!, param: "page"), '5');
    });
  });
}
