String stubTextFields() => '''
import 'package:flutter/material.dart';

class PrimaryTextFieldWidget extends StatelessWidget {
  final String? labelText;
  final TextEditingController controller;
  final bool obscureText;
  final int maxLines;
  final TextInputType textInputType;
  final bool autoFocus;
  final TextAlign? textAlign;
  final bool enableSuggestions;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;

  PrimaryTextFieldWidget(
      {Key? key,
        required this.controller,
        this.labelText,
        this.obscureText = false,
        this.autoFocus = false,
        this.textInputType = TextInputType.text,
        this.textAlign,
        this.maxLines = 1,
        this.enableSuggestions = true,
        this.hintText,
        this.hintStyle,
        this.focusNode})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        hintStyle: hintStyle,
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black54),
        ),
      ),
      controller: controller,
      keyboardAppearance: Brightness.light,
      autofocus: autoFocus,
      textAlign: textAlign ?? TextAlign.left,
      maxLines: maxLines,
      keyboardType: textInputType,
      textCapitalization: (textInputType == TextInputType.emailAddress
          ? TextCapitalization.none
          : TextCapitalization.sentences),
      obscureText: obscureText,
      focusNode: focusNode,
      enableSuggestions: enableSuggestions,
    );
  }
}
''';
