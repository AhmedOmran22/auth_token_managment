import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.onSaved,
    this.hintText,
    required this.controller,
    this.textInputType = TextInputType.text,
    this.validator,
    this.suffixIcon,
    this.maxLines,
    this.enabled,
  });
  final String? hintText;
  final Function(String?)? onSaved;
  final TextEditingController? controller;
  final TextInputType? textInputType;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final int? maxLines;
  final bool? enabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: enabled,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(
          context,
        ).textTheme.titleMedium!.copyWith(color: Colors.grey, fontSize: 14),
        suffixIcon: suffixIcon,
        border: Theme.of(context).inputDecorationTheme.border,
        focusedBorder: Theme.of(context).inputDecorationTheme.focusedBorder,
        enabledBorder: Theme.of(context).inputDecorationTheme.enabledBorder,
      ),
      style: Theme.of(
        context,
      ).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500, fontSize: 14),
      cursorColor: Colors.blueGrey,
      keyboardType: textInputType,
      controller: controller,
      validator: validator,
      onSaved: onSaved,
    );
  }
}
