import 'package:innovation/core/routes/route_config.dart' as rc;
import 'package:flutter/material.dart';

class InnoAppBarTitle extends StatelessWidget {
  const InnoAppBarTitle({
    Key? key,
    this.overridedTitle,
  }) : super(key: key);

  final String? overridedTitle;

  @override
  Widget build(BuildContext context) {
    String? title = overridedTitle ?? rc.RouteConfig.title(context);
    return Text(
      title ?? "",
      style: Theme.of(context).appBarTheme.titleTextStyle,
    );
  }
}
