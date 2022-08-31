import 'package:flutter/material.dart';

import '../../../constants/config_constant.dart';
import '../../../theme/material3/m3_color.dart';

class ErFourButtons extends StatelessWidget {
  final void Function()? onLeft;
  final void Function()? onUp;
  final void Function()? onRight;
  final void Function()? onDown;
  final Color? buttonColor;

  const ErFourButtons({
    Key? key,
    this.onLeft,
    this.onUp,
    this.onRight,
    this.onDown,
    this.buttonColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 168,
      width: 168,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildAButton(
            context: context,
            icon: Icons.keyboard_arrow_left,
            onTap: onLeft,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildAButton(
                context: context,
                icon: Icons.keyboard_arrow_up,
                onTap: onUp,
              ),
              _buildAButton(
                context: context,
                icon: Icons.keyboard_arrow_down,
                onTap: onDown,
              ),
            ],
          ),
          _buildAButton(
            context: context,
            icon: Icons.keyboard_arrow_right,
            onTap: onRight,
          ),
        ],
      ),
    );
  }

  _buildAButton({
    required BuildContext context,
    required IconData icon,
    void Function()? onTap,
  }) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: buttonColor ?? M3Color.of(context).primary,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        icon: Icon(
          icon,
          size: ConfigConstant.iconSize2,
        ),
        onPressed: onTap,
      ),
    );
  }
}
