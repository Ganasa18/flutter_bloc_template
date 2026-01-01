import 'package:flutter/material.dart';
import 'package:my_template/config/app_config.dart';
import 'package:my_template/injection/injector.dart';
import 'package:my_template/routing/route.dart';
import 'package:my_template/theme/theme.dart';

showSnackbar({
  required String? title,
  Color? color,
  Color? textColor,
}) =>
    ScaffoldMessenger.of(inject<AppRouter>().navigatorKey.currentState!.context)
        .showSnackBar(
      SnackBar(
        content: Text(
          title!,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: MyTheme.style.title.copyWith(
            fontSize: AppSetting.setFontSize(40),
            color: textColor ?? Colors.white,
          ),
        ),
        backgroundColor: color,
      ),
    );
