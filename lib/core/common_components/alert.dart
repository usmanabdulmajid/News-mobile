// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:news_mobile/core/theme/app_colors.dart';

class Alert {
  static Future<void> show(
    BuildContext context, {
    String? title,
    required String description,
    bool success = false,
  }) async {
    await Future.delayed(const Duration(milliseconds: 200));
    await Flushbar(
      title: title,
      message: description.isEmpty ? 'Something went wrong' : description,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      borderRadius: BorderRadius.circular(20),
      icon: success
          ? const Icon(Icons.done_rounded, color: AppColors.white)
          : const Icon(
              Icons.error,
              color: AppColors.white,
            ),
      backgroundColor: success ? Colors.green : const Color(0xFFFF5E5E),
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
      flushbarPosition:
          success ? FlushbarPosition.TOP : FlushbarPosition.BOTTOM,
      duration: const Duration(seconds: 3),
    ).show(context);
  }
}
