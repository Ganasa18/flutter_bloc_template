import 'package:flutter/material.dart';

class ContentType {
  /// message is `required` parameter
  final String message;

  /// color is optional, if provided null then `DefaultColors` will be used
  final Color? color;

  const ContentType(this.message, [this.color]);

  static const ContentType help = ContentType(
    'help',
    DefaultColors.helpBlue,
  );
  static const ContentType failure = ContentType(
    'failure',
    DefaultColors.failureRed,
  );
  static const ContentType success = ContentType(
    'success',
    DefaultColors.successGreen,
  );
  static const ContentType warning = ContentType(
    'warning',
    DefaultColors.warningYellow,
  );
}

/// `DefaultColors` incase `color` paramter is null in `ContentType`
class DefaultColors {
  /// help
  static const Color helpBlue = Color(0xff3282B8);

  /// failure
  static const Color failureRed = Color(0xffc72c41);

  /// success
  static const Color successGreen = Color(0xff2D6A4F);

  /// warning
  static const Color warningYellow = Color(0xffFCA652);
}

class AssetsPath {
  static const String help = 'assets/snackbar/help.svg';
  static const String failure = 'assets/snackbar/failure.svg';
  static const String success = 'assets/snackbar/success.svg';
  static const String warning = 'assets/snackbar/warning.svg';

  static const String back = 'assets/snackbar/back.svg';
  static const String bubbles = 'assets/snackbar/bubbles.svg';
}
