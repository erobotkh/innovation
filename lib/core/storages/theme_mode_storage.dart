import 'package:flutter/material.dart';
import 'package:innovation/core/storages/base_object_storages/enum_storage.dart';

class ThemeModeStorage extends EnumStorage<ThemeMode> {
  @override
  List<ThemeMode> get values => ThemeMode.values;
}
