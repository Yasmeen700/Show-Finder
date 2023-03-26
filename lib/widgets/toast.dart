import 'package:flutter/material.dart';
import 'package:m2_test/constants/app_colors.dart';


class Toast {
  void showToast(BuildContext context, String message, {Color? color , Duration? duration}) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: color ?? AppColors.primaryColor,
        duration: duration ?? const Duration(seconds: 1),
      ),
    );
  }
}
