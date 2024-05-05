import 'package:currencypro/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.hint,
    this.hintStyle,
    this.onFieldSubmitted,
  });

  final TextEditingController? controller;
  final String? hint;
  final TextStyle? hintStyle;
  final void Function(String)? onFieldSubmitted;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late final FocusNode focusNode;
  bool isActive = false;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();
    focusNode.addListener(onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.removeListener(onFocusChange);
    focusNode.dispose();
  }

  void onFocusChange() {
    if (focusNode.hasFocus) {
      setState(() {
        isActive = true;
      });
    } else {
      setState(() {
        isActive = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: focusNode,
      controller: widget.controller,
      style: TextStyle(
        color: isActive ? AppColors.appBlueColor : Colors.white,
        decorationColor: Colors.transparent,
      ),
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        hintText: widget.hint,
        hintStyle: widget.hintStyle ?? const TextStyle(color: Colors.white54),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.appBlueColor),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
      ),
    );
  }
}
