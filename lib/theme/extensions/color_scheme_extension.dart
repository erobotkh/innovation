import 'package:flutter/material.dart';
import 'package:innovation/theme/material3/m3_read_only_color.dart';

extension ColorSchemeExtension on ColorScheme {
  M3ReadOnlyColor get readOnly => M3ReadOnlyColor(this);
}
