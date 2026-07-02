import 'package:flutter/material.dart';

import '../../../core/extensions/context_ext.dart';

class LabeledOutlineTextField extends StatelessWidget {
  const LabeledOutlineTextField({
    super.key,
    required this.label,
    required this.controller,
    required this.onChanged,
    this.keyboardType,
    this.obscureText = false,
    this.suffixIcon,
    this.textStyle,
  });

  final String label;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final TextInputType? keyboardType;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: obscureText,
          onChanged: onChanged,
          style: textStyle??
          context.textTheme.titleMedium
          ,
          decoration: InputDecoration(
            hintText: 'Enter $label',
            suffixIcon: suffixIcon == null
                ? null
                : Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  child: suffixIcon,
                ),

            hintStyle: context.theme.textTheme.bodyMedium,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primary.withOpacity(0.6), width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
