import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';

class CustomTextfield extends StatelessWidget {
  final Widget suffix;
  final Color filledColor;
  final String? hintText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  const CustomTextfield({
    Key? key,
    required this.suffix,
    this.filledColor = AppColors.white,
    this.hintText,
    this.controller,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        filled: true,
        fillColor: filledColor,
        hintText: hintText,
        contentPadding: const EdgeInsets.all(10),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(16),
        ),
        suffixIcon: CupertinoButton(
          padding: EdgeInsets.zero,
          onPressed: () {},
          child: Container(
            width: 50,
            height: 50,
            alignment: AlignmentDirectional.center,
            padding: const EdgeInsetsDirectional.all(16),
            margin: const EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
              color: AppColors.azureRadiance,
              borderRadius: BorderRadius.circular(16),
            ),
            child: suffix,
          ),
        ),
      ),
    );
  }
}
