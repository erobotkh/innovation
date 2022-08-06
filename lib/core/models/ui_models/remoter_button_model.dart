// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:innovation/theme/material3/m3_color.dart';

class RemotterButtonModel {
  String label;
  Widget child;
  Color color;
  bool showLabel;
  void Function() onTap;

  RemotterButtonModel({
    required this.label,
    this.showLabel = false,
    this.color = Colors.white,
    required this.child,
    required this.onTap,
  });

  static List<RemotterButtonModel> getButtonList(BuildContext context) {
    var buttonWhite = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontWeight: FontWeight.w600);
    var buttonBlack = Theme.of(context)
        .textTheme
        .button!
        .copyWith(fontWeight: FontWeight.w600, color: Colors.black);
    return [
      RemotterButtonModel(
        label: 'CH-',
        child: Text(
          'CH-',
          style: buttonWhite.copyWith(
            color: M3Color.of(context).onPrimary,
          ),
        ),
        color: M3Color.dayColorsOf(context)[DateTime.monday]!,
        onTap: () {
          print('CH-');
        },
      ),
      RemotterButtonModel(
        label: 'CH',
        child: Text(
          'CH-',
          style: buttonWhite.copyWith(
            color: M3Color.of(context).onPrimary,
          ),
        ),
        color: M3Color.dayColorsOf(context)[DateTime.monday]!,
        onTap: () {
          print('CH');
        },
      ),
      RemotterButtonModel(
        label: 'CH+',
        child: Text(
          'CH-',
          style: buttonWhite.copyWith(
            color: M3Color.of(context).onPrimary,
          ),
        ),
        color: M3Color.dayColorsOf(context)[DateTime.monday]!,
        onTap: () {
          print('CH+');
        },
      ),
      RemotterButtonModel(
        label: 'PREV',
        showLabel: true,
        child: Icon(
          Icons.first_page,
          color: M3Color.of(context).onPrimary,
        ),
        color: M3Color.dayColorsOf(context)[DateTime.friday]!,
        onTap: () {
          print('first page');
        },
      ),
      RemotterButtonModel(
        label: 'NEXT',
        showLabel: true,
        child: Icon(
          Icons.last_page,
          color: M3Color.of(context).onPrimary,
        ),
        color: M3Color.dayColorsOf(context)[DateTime.friday]!,
        onTap: () {
          print('last page');
        },
      ),
      RemotterButtonModel(
        label: 'PLAY/PUSH',
        showLabel: true,
        child: Icon(
          Icons.play_arrow,
          color: M3Color.of(context).onPrimary,
        ),
        color: M3Color.dayColorsOf(context)[DateTime.thursday]!,
        onTap: () {
          print('play arrow');
        },
      ),
      RemotterButtonModel(
        showLabel: true,
        label: 'VOL-',
        child: Icon(
          Icons.remove,
          color: M3Color.of(context).onPrimary,
        ),
        color: Colors.grey,
        onTap: () {
          print('-');
        },
      ),
      RemotterButtonModel(
        showLabel: true,
        label: 'VOL+',
        child: Icon(
          Icons.add,
          color: M3Color.of(context).onPrimary,
        ),
        color: Colors.grey,
        onTap: () {
          print('+');
        },
      ),
      RemotterButtonModel(
        label: 'HQ',
        child: Text(
          'HQ',
          style: buttonWhite.copyWith(
            color: M3Color.of(context).onPrimary,
          ),
        ),
        color: M3Color.dayColorsOf(context)[DateTime.wednesday]!,
        onTap: () {
          print('HQ');
        },
      ),
      RemotterButtonModel(
        label: '0',
        child: Text(
          '0',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('0');
        },
      ),
      RemotterButtonModel(
        label: '100+',
        color: M3Color.dayColorsOf(context)[DateTime.friday]!,
        child: Text(
          '100+',
          style: buttonWhite.copyWith(
            color: M3Color.of(context).onPrimary,
          ),
        ),
        onTap: () {
          print('100+');
        },
      ),
      RemotterButtonModel(
        label: '200+',
        color: M3Color.dayColorsOf(context)[DateTime.friday]!,
        child: Text('200+',
            style: buttonWhite.copyWith(
              color: M3Color.of(context).onPrimary,
            )),
        onTap: () {
          print('200+');
        },
      ),
      RemotterButtonModel(
        label: '1',
        child: Text(
          '1',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('1');
        },
      ),
      RemotterButtonModel(
        label: '2',
        child: Text(
          '2',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('2');
        },
      ),
      RemotterButtonModel(
        label: '3',
        child: Text(
          '3',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('3');
        },
      ),
      RemotterButtonModel(
        label: '4',
        child: Text(
          '4',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('4');
        },
      ),
      RemotterButtonModel(
        label: '5',
        child: Text(
          '5',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('5');
        },
      ),
      RemotterButtonModel(
        label: '6',
        child: Text(
          '6',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('6');
        },
      ),
      RemotterButtonModel(
        label: '7',
        child: Text(
          '7',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('7');
        },
      ),
      RemotterButtonModel(
        label: '8',
        child: Text(
          '8',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('8');
        },
      ),
      RemotterButtonModel(
        label: '9',
        child: Text(
          '9',
          style: buttonBlack.copyWith(
            color: M3Color.of(context).background,
          ),
        ),
        color: M3Color.of(context).onBackground,
        onTap: () {
          print('9');
        },
      ),
    ];
  }
}
