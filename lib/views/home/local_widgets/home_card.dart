import 'package:decorated_icon/decorated_icon.dart';
import 'package:flutter/material.dart';
import 'package:innovation/constants/config_constant.dart';
import 'package:innovation/theme/material3/m3_color.dart';
import 'package:innovation/theme/material3/m3_text_theme.dart';
import 'package:innovation/views/home/src/home_card_object.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    Key? key,
    required this.object,
    this.backgroundColor,
    this.foregroundColor,
    required this.extentHeight,
  }) : super(key: key);

  final HomeCardObject object;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final double extentHeight;

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      margin: EdgeInsets.zero,
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: ConfigConstant.circlarRadius1,
        side: BorderSide(color: Theme.of(context).colorScheme.onBackground.withOpacity(0.1)),
      ),
      color: backgroundColor,
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    object.title,
                    maxLines: 1,
                    style: M3TextTheme.of(context).titleMedium?.copyWith(color: foregroundColor),
                  ),
                  Text(
                    "${object.subtitle}\n",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: M3TextTheme.of(context).bodyMedium?.copyWith(color: foregroundColor),
                  ),
                  SizedBox(height: ConfigConstant.margin1 + extentHeight),
                  Container(
                    alignment: Alignment.bottomRight,
                    padding: const EdgeInsets.only(right: 4.0, bottom: 4.0),
                    child: DecoratedIcon(
                      object.iconData,
                      color: foregroundColor,
                      size: ConfigConstant.iconSize5,
                      shadows: [
                        BoxShadow(
                          color: M3Color.of(context).onSurface.withOpacity(0.2),
                          offset: const Offset(0.0, 1.0), //(x,y)
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
