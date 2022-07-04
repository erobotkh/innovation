import 'package:innovation/core/storages/base_object_storages/bool_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FakeBoolStorage extends BoolStorage {}

void main() {
  SharedPreferences.setMockInitialValues({});

  group("FakeBoolStorage < BoolStorage", () {
    test("it return true from storage", () async {
      final fakeStorage = FakeBoolStorage();

      const expectedBool = true;
      await fakeStorage.write(expectedBool);

      final boolFromStorage = await fakeStorage.read();
      expect(boolFromStorage, expectedBool);
    });

    test("it return false from storage", () async {
      final fakeStorage = FakeBoolStorage();

      const expectedBool = false;
      await fakeStorage.write(expectedBool);

      final boolFromStorage = await fakeStorage.read();
      expect(boolFromStorage, expectedBool);
    });

    test("it remove value from storage", () async {
      final fakeStorage = FakeBoolStorage();

      await fakeStorage.write(true);
      await fakeStorage.remove();

      final boolFromStorage = await fakeStorage.read();
      expect(boolFromStorage, null);
    });
  });
}
