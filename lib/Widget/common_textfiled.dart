import 'package:assgintodo/Widget/constant.dart';
import 'package:flutter/material.dart';


// CommonTextFieldWithBorder
class CommonTextFieldWithBorder extends StatefulWidget {
  const CommonTextFieldWithBorder({Key? key,
    this.label,
    this.hint,
    this.controller,
    this.validator,
    this.suffix,
    this.prefix,
    this.contentPadding,
    required this.obscure,
    this.keyboardType,
    this.maxLength,
    this.onSaved,
    this.onFieldSubmitted,
    this.onChanged,
    this.textInputAction,
    this.isEnable,
    // this.maxLines,
    // this.minLines,
    this.fillColor,
    this.filled,
    this.initialValue,
    this.focusNode,
    this.errorText,
  }) : super(key: key);

  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final FormFieldValidator? validator;
  final dynamic suffix;
  final dynamic prefix;
  final EdgeInsetsGeometry? contentPadding;
  final bool obscure;
  final dynamic keyboardType;
  final int? maxLength;
  final Function(String? value)? onSaved;
  final Function(String? value)? onFieldSubmitted;
  final Function(String? value)? onChanged;
  final bool? isEnable;
  // final int? minLines;
  // final int? maxLines;
  final Color? fillColor;
  final bool? filled;
  final String? initialValue;
  final FocusNode? focusNode;
  final String? errorText;

  final TextInputAction? textInputAction;

  @override
  State<CommonTextFieldWithBorder> createState() =>
      _CommonTextFieldWithBorderState();
}

class _CommonTextFieldWithBorderState extends State<CommonTextFieldWithBorder> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      initialValue: widget.initialValue,
      // minLines: widget.minLines,
      // maxLines: widget.maxLines,
      enabled: widget.isEnable,
      onSaved: widget.onSaved,
      focusNode: widget.focusNode,
      keyboardType: widget.keyboardType,
      maxLength: widget.maxLength,
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscure,
      textInputAction: widget.textInputAction,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onFieldSubmitted,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        filled: widget.filled,
        fillColor: widget.fillColor,
        hintStyle:TextStyle(
          color:Color(hintColor),
          fontWeight: FontWeight.w100,
          fontSize: 14,
          height: 22 / 10,
        ),
        contentPadding: widget.contentPadding,
        suffixIcon: widget.suffix,
        prefixIcon: widget.prefix,
        labelText: widget.label,
        labelStyle:  TextStyle(color: Color(tealColor)),
        hintText: widget.hint,
        errorText: widget.errorText,
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:Color(tealColor)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: const BorderSide(color:Colors.red),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color:Color(tealColor)), 
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: Color(blackColor)),
        ),
      ),
    );
  }
}