import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_mobile/core/theme/app_colors.dart';
import 'package:news_mobile/core/utils/sizing.dart';

class CustomFormField extends StatefulWidget {
  final TextEditingController controller;
  final String? title;
  final String? hintText;
  final bool obscureText;
  final ValueChanged<String?>? onChanged;

  const CustomFormField({
    required this.controller,
    this.obscureText = false,
    this.title,
    this.hintText,
    this.onChanged,
    super.key,
  });

  @override
  State<CustomFormField> createState() => _CustomFormFieldState();
}

class _CustomFormFieldState extends State<CustomFormField> {
  late bool obscureText = widget.obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null) ...[
          Text(
            widget.title!,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const YMargin(8),
        ],
        TextFormField(
          controller: widget.controller,
          cursorColor: AppColors.azureRadiance,
          style: const TextStyle(color: AppColors.scorpion),
          decoration: InputDecoration(
            suffixIconConstraints: const BoxConstraints(
              minHeight: 16,
              minWidth: 16,
              maxHeight: 30,
              maxWidth: 30,
            ),
            contentPadding: const EdgeInsets.all(12),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.azureRadiance),
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.mercury),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.mercury),
              borderRadius: BorderRadius.circular(8),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.redAccent),
              borderRadius: BorderRadius.circular(8),
            ),
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              color: Colors.black26,
            ),
            suffixIcon: widget.obscureText
                ? CupertinoButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: obscureText
                        ? const Icon(
                            Icons.remove_red_eye,
                            size: 16,
                            color: AppColors.dustyGrey,
                          )
                        : const Icon(
                            Icons.visibility_off,
                            size: 16,
                            color: AppColors.dustyGrey,
                          ),
                  )
                : null,
          ),
          obscureText: obscureText,
          onChanged: widget.onChanged,
        ),
      ],
    );
  }
}
