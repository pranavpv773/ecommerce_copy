import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final String labelText;
  final String initialValue;
  final TextInputType keyboardType;
  final bool obscure;
  final TextInputAction inputAction;
  final TextCapitalization textCapitalization;
  final FormFieldValidator<String>? validator;
  final GlobalKey<FormFieldState>? _fieldKey;
  final ValueChanged<String>? fieldSubmitted;
  final FocusNode? focus;
  final ValueChanged<String>? onChanged;
  final Widget? prefix;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final dynamic maxLines;
  final int? minLines;
  final List<TextInputFormatter> inputFormatters;
  final bool isReadOnly;
  final TextAlign textAlign;
  final VoidCallback? onTap;
  final BoxConstraints iconConstraints;
  final Color textColor;
  final AutovalidateMode? autovalidateMode;
  final Color? fillColor;
  final TextStyle? textstyle;
  final bool? isEnabledTextFiled;
  final double? borderRadius;
  final Iterable<String>? autoFillHints;
  final int scrollpadding;
  final Color? labelColor;
  final Color? fontColor;
  final TextStyle? labelStyle;
  // final bool showCursor;

  final double outlineBorder;

  const CommonTextField({
    this.controller,
    this.outlineBorder = 0,
    this.fontColor,
    this.labelStyle,
    // this.showCursor = false,
    this.labelColor,
    this.labelText = "",
    this.autoFillHints,
    this.initialValue = "",
    GlobalKey<FormFieldState>? globalKey,
    this.keyboardType = TextInputType.text,
    this.obscure = false,
    this.inputAction = TextInputAction.next,
    this.validator,
    this.fieldSubmitted,
    this.focus,
    this.onChanged,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.inputFormatters = const [],
    this.maxLines = 1,
    this.minLines,
    this.isReadOnly = false,
    this.hintText = "",
    this.textAlign = TextAlign.start,
    this.onTap,
    this.textColor = const Color(0xff181C1F),
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.fillColor,
    this.textstyle,
    this.borderRadius = 0,
    this.textCapitalization = TextCapitalization.none,
    this.iconConstraints = const BoxConstraints(maxWidth: 120),
    this.scrollpadding = 0,
    Key? key,
    this.isEnabledTextFiled = true,
  })  : _fieldKey = globalKey,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(outlineBorder),
      child: TextFormField(
        mouseCursor: MouseCursor.defer,
        // enableInteractiveSelection: false,
        enabled: isEnabledTextFiled,
        autofillHints: autoFillHints,
        textCapitalization: textCapitalization,
        keyboardAppearance: Brightness.dark,
        scrollPadding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom + scrollpadding),
        initialValue: initialValue == '' ? null : initialValue,
        onTap: onTap,
        key: _fieldKey,
        validator: validator,
        obscuringCharacter: "•",
        textInputAction: inputAction,
        onFieldSubmitted: fieldSubmitted,
        controller: controller,
        // showCursor: showCursor,

        focusNode: focus,
        obscureText: obscure,
        onChanged: onChanged,
        style: textstyle?.copyWith(color: fontColor),
        keyboardType: keyboardType,
        autovalidateMode: autovalidateMode,
        textAlign: textAlign,
        maxLines: maxLines,
        minLines: minLines,
        readOnly: isReadOnly,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
            fillColor: fillColor,
            labelText: labelText,
            hintText: hintText,
            prefix: prefix,
            labelStyle: labelStyle,
            suffix: suffix,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            errorMaxLines: 2,
            prefixIconConstraints: iconConstraints,
            suffixIconConstraints: iconConstraints,
            border: InputBorder.none,
            focusedBorder: InputBorder.none),
      ),
    );
  }
}
