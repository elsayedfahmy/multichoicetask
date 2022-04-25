

import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/widgets/is_password_icon.dart';

class PassWordTextField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTitle;
  final String labelTitle;
  final Function(String v) onChanged;
  final Function(String? v) onvalidator;
  final Function(String value) onSubmit;
  final TextInputAction? textInputAction;
  final TextInputType? inputType;

  const PassWordTextField(
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
  _PassWordTextFieldState createState() => _PassWordTextFieldState();
}

class _PassWordTextFieldState extends State<PassWordTextField> {
  bool isPassword=true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      obscuringCharacter: '*',
      cursorColor: ColorManager.primary,
      controller: widget.controller,
      keyboardType: widget.inputType,
      style: TextStyle(
          color: ColorManager.primary,
          fontSize: 14,
          fontFamily: FontContants.fontFamily,
          fontWeight: FontWeight.normal),
      textInputAction: widget.textInputAction,

      onFieldSubmitted: (String v) =>widget.onSubmit(v),
      onTap: () {
      },
      onChanged: (v) => widget.onChanged(v),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator:(value)=> widget.onvalidator(value),
      decoration: InputDecoration(
          alignLabelWithHint: true,
          suffix: InkWell(
              onTap: (){

                setState(() {
                  isPassword=!isPassword;
                });
              },
              child:  IsPasswordIcon(isPassWord: isPassword)),
          hintText: widget.hintTitle,
          labelText: widget.labelTitle,
          filled: true,
          fillColor: ColorManager.white,
         ),
    );
  }
}
