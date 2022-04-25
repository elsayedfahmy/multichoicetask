

import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';

class EmailTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTitle;
  final String labelTitle;
  final Function(String v) onChanged;
  final Function(String? v) onvalidator;
  final Function(String value) onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;
  const EmailTextField(
      {Key? key,
      required this.onChanged,
      required this.onvalidator,
      required this.controller,
      required this.hintTitle,
      required this.labelTitle,
      required this.onSubmit,
      required this.inputType,
      required this.textInputAction})
      : super(key: key);

  @override
  _EmailTextFieldState createState() => _EmailTextFieldState();
}

class _EmailTextFieldState extends State<EmailTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: ColorManager.primary,
      controller: widget.controller,
      keyboardType: widget.inputType,
      style: TextStyle(
          color: ColorManager.primary,
          fontSize: 14,
          fontFamily: FontContants.fontFamily,
          fontWeight: FontWeight.normal),
      // showCursor: true,
      // readOnly: widget.if_home,
      textInputAction: widget.textInputAction,

      onFieldSubmitted: (String v) =>widget.onSubmit(v),
      onTap: () {
      },
      onChanged: (v) => widget.onChanged(v),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:(value)=> widget.onvalidator(value),
      decoration: InputDecoration(
          alignLabelWithHint: true,
          hintText: widget.hintTitle,
          labelText: widget.labelTitle,
          // contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 2),
          filled: true,
          fillColor: ColorManager.white,
          ),
    );
  }
}
