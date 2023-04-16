import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';

class AuthButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  const AuthButton({
    Key? key,
    required this.onPressed,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(AppColors.azureRadiance),
        foregroundColor: MaterialStateProperty.all(
          AppColors.white,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
      child: Text(label),
    );
  }
}
