// ignore_for_file: no_leading_underscores_for_local_identifiers

import 'dart:math' as math;
import 'package:flutter/material.dart';

import 'circle_view.dart';

typedef JoystickDirectionCallback = void Function(double degrees, double distance);
typedef JoystickSpecificDirectionCallback = void Function(ErJoystickDirection? direction);

enum ErJoystickDirection {
  top,
  topRight,
  right,
  bottomRight,
  bottom,
  bottomLeft,
  left,
  topLeft,
  stop,
}

class ErJoystick extends StatelessWidget {
  /// The size of the joystick.
  ///
  /// Defaults to half of the width in the portrait
  /// or half of the height in the landscape mode
  final double? size;

  /// Color of the icons
  ///
  /// Defaults to [Colors.white54]
  final Color iconsColor;

  /// Color of the joystick background
  ///
  /// Defaults to [Colors.blueGrey]
  final Color backgroundColor;

  /// Color of the inner (smaller) circle background
  ///
  /// Defaults to [Colors.blueGrey]
  final Color innerCircleColor;

  /// Opacity of the joystick
  ///
  /// The opacity applies to the whole joystick including icons
  ///
  /// Defaults to [null] which means there will be no [Opacity] widget used
  final double? opacity;

  /// Callback to be called when user pans the joystick
  ///
  /// Defaults to [null]
  final JoystickDirectionCallback? onDirectionChanged;
  final JoystickSpecificDirectionCallback? onSpecificDirectionChanged;

  /// Indicates how often the [onDirectionChanged] should be called.
  ///
  /// Defaults to [null] which means there will be no lower limit.
  /// Setting it to ie. 1 second will cause the callback to be not called more often
  /// than once per second.
  ///
  /// The exception is the [onDirectionChanged] callback being called
  /// on the [onPanStart] and [onPanEnd] callbacks. It will be called immediately.
  final Duration? interval;

  /// Shows top/right/bottom/left arrows on top of Joystick
  ///
  /// Defaults to [true]
  final bool showArrows;

  const ErJoystick({
    Key? key,
    this.size,
    this.iconsColor = Colors.white54,
    this.backgroundColor = Colors.blueGrey,
    this.innerCircleColor = Colors.blueGrey,
    this.opacity,
    this.onDirectionChanged,
    this.onSpecificDirectionChanged,
    this.interval,
    this.showArrows = true,
  }) : super(key: key);

  void _onDirectionChanged(double degrees, double distance) {
    if (onDirectionChanged != null) onDirectionChanged!(degrees, distance);
    if (onSpecificDirectionChanged == null) return;

    if (distance <= 0.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.stop);
    } else if (degrees >= -22.5 && degrees < 22.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.top);
    } else if (degrees >= 22.5 && degrees < 67.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.topRight);
    } else if (degrees >= 67.5 && degrees < 112.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.right);
    } else if (degrees >= 112.5 && degrees < 157.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.bottomRight);
    } else if (degrees >= 157.5 && degrees < 202.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.bottom);
    } else if (degrees >= 202.5 && degrees < 247.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.bottomLeft);
    } else if (degrees >= 247.5 && degrees < 292.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.left);
    } else if (degrees >= 292.5 && degrees < 337.5) {
      onSpecificDirectionChanged!(ErJoystickDirection.topLeft);
    }
  }

  @override
  Widget build(BuildContext context) {
    double actualSize = size ?? math.min(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height) * 0.5;
    double innerCircleSize = actualSize / 2;
    Offset lastPosition = Offset(innerCircleSize, innerCircleSize);
    Offset joystickInnerPosition =
        _calculatePositionOfInnerCircle(lastPosition, innerCircleSize, actualSize, const Offset(0, 0));

    DateTime? _callbackTimestamp;

    return Center(
      child: StatefulBuilder(
        builder: (context, setState) {
          Widget joystick = Stack(
            children: <Widget>[
              CircleView.joystickCircle(
                actualSize,
                backgroundColor,
              ),
              Positioned(
                top: joystickInnerPosition.dy,
                left: joystickInnerPosition.dx,
                child: CircleView.joystickInnerCircle(
                  actualSize / 2,
                  innerCircleColor,
                ),
              ),
              if (showArrows) ...createArrows(),
            ],
          );

          return GestureDetector(
            onPanStart: (details) {
              _callbackTimestamp = _processGesture(
                actualSize,
                actualSize / 2,
                details.localPosition,
                _callbackTimestamp,
              );
              setState(() => lastPosition = details.localPosition);
            },
            onPanEnd: (details) {
              _callbackTimestamp = null;
              _onDirectionChanged(0, 0);
              joystickInnerPosition = _calculatePositionOfInnerCircle(
                  Offset(innerCircleSize, innerCircleSize), innerCircleSize, actualSize, const Offset(0, 0));
              setState(() => lastPosition = Offset(innerCircleSize, innerCircleSize));
            },
            onPanUpdate: (details) {
              _callbackTimestamp =
                  _processGesture(actualSize, actualSize / 2, details.localPosition, _callbackTimestamp);
              joystickInnerPosition =
                  _calculatePositionOfInnerCircle(lastPosition, innerCircleSize, actualSize, details.localPosition);

              setState(() => lastPosition = details.localPosition);
            },
            child: (opacity != null) ? Opacity(opacity: opacity!, child: joystick) : joystick,
          );
        },
      ),
    );
  }

  List<Widget> createArrows() {
    return [
      Positioned(
        top: 16.0,
        left: 0.0,
        right: 0.0,
        child: Icon(
          Icons.arrow_upward,
          color: iconsColor,
        ),
      ),
      Positioned(
        top: 0.0,
        bottom: 0.0,
        left: 16.0,
        child: Icon(
          Icons.arrow_back,
          color: iconsColor,
        ),
      ),
      Positioned(
        top: 0.0,
        bottom: 0.0,
        right: 16.0,
        child: Icon(
          Icons.arrow_forward,
          color: iconsColor,
        ),
      ),
      Positioned(
        bottom: 16.0,
        left: 0.0,
        right: 0.0,
        child: Icon(
          Icons.arrow_downward,
          color: iconsColor,
        ),
      ),
    ];
  }

  DateTime? _processGesture(double size, double ignoreSize, Offset offset, DateTime? callbackTimestamp) {
    double middle = size / 2.0;

    double angle = math.atan2(offset.dy - middle, offset.dx - middle);
    double degrees = angle * 180 / math.pi + 90;
    if (offset.dx < middle && offset.dy < middle) {
      degrees = 360 + degrees;
    }

    double dx = math.max(0, math.min(offset.dx, size));
    double dy = math.max(0, math.min(offset.dy, size));

    double distance = math.sqrt(math.pow(middle - dx, 2) + math.pow(middle - dy, 2));

    double normalizedDistance = math.min(distance / (size / 2), 1.0);

    DateTime? _callbackTimestamp = callbackTimestamp;
    if (_canCallOnDirectionChanged(callbackTimestamp)) {
      _callbackTimestamp = DateTime.now();
      _onDirectionChanged(degrees, normalizedDistance);
    }

    return _callbackTimestamp;
  }

  /// Checks if the [onDirectionChanged] can be called.
  ///
  /// Returns true if enough time has passed since last time it was called
  /// or when there is no [interval] set.
  bool _canCallOnDirectionChanged(DateTime? callbackTimestamp) {
    if (interval != null && callbackTimestamp != null) {
      int intervalMilliseconds = interval!.inMilliseconds;
      int timestampMilliseconds = callbackTimestamp.millisecondsSinceEpoch;
      int currentTimeMilliseconds = DateTime.now().millisecondsSinceEpoch;

      if (currentTimeMilliseconds - timestampMilliseconds <= intervalMilliseconds) {
        return false;
      }
    }

    return true;
  }

  Offset _calculatePositionOfInnerCircle(Offset lastPosition, double innerCircleSize, double size, Offset offset) {
    double middle = size / 2.0;

    double angle = math.atan2(offset.dy - middle, offset.dx - middle);
    double degrees = angle * 180 / math.pi;
    if (offset.dx < middle && offset.dy < middle) {
      degrees = 360 + degrees;
    }
    bool isStartPosition = lastPosition.dx == innerCircleSize && lastPosition.dy == innerCircleSize;
    double lastAngleRadians = (isStartPosition) ? 0 : (degrees) * (math.pi / 180.0);

    var rBig = size / 2;
    var rSmall = innerCircleSize / 2;

    var x = (lastAngleRadians == -1) ? rBig - rSmall : (rBig - rSmall) + (rBig - rSmall) * math.cos(lastAngleRadians);
    var y = (lastAngleRadians == -1) ? rBig - rSmall : (rBig - rSmall) + (rBig - rSmall) * math.sin(lastAngleRadians);

    var xPosition = lastPosition.dx - rSmall;
    var yPosition = lastPosition.dy - rSmall;

    var angleRadianPlus = lastAngleRadians + math.pi / 2;
    if (angleRadianPlus < math.pi / 2) {
      if (xPosition > x) {
        xPosition = x;
      }
      if (yPosition < y) {
        yPosition = y;
      }
    } else if (angleRadianPlus < math.pi) {
      if (xPosition > x) {
        xPosition = x;
      }
      if (yPosition > y) {
        yPosition = y;
      }
    } else if (angleRadianPlus < 3 * math.pi / 2) {
      if (xPosition < x) {
        xPosition = x;
      }
      if (yPosition > y) {
        yPosition = y;
      }
    } else {
      if (xPosition < x) {
        xPosition = x;
      }
      if (yPosition < y) {
        yPosition = y;
      }
    }
    return Offset(xPosition, yPosition);
  }
}
