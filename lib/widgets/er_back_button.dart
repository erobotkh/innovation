import 'package:flutter/material.dart';

import 'er_tap_effect.dart';

class ErBackButton extends StatelessWidget {
  const ErBackButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ErTapEffect(
      child: const Icon(Icons.arrow_back),
      onTap: () => Navigator.pop(context),
    );
  }
}
