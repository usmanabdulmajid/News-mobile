import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';

class PasswordStrength extends StatelessWidget {
  final int length;
  final int strength;
  const PasswordStrength({super.key, this.strength = 0, this.length = 4});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        length,
        (index) {
          return Expanded(
            child: Container(
              margin: EdgeInsets.only(right: index != length - 1 ? 8 : 0),
              height: 4,
              decoration: BoxDecoration(
                color: strength - 1 >= index ? Colors.green : AppColors.mercury,
                borderRadius: BorderRadiusDirectional.circular(4),
              ),
            ),
          );
        },
      ),
    );
  }
}
