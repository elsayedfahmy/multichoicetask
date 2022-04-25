import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/widgets/space.dart';
import 'package:task/widgets/text/regular_text.dart';

class CalenderDropButton extends StatefulWidget {
 final List<String> list;
  String? initaldata;
Function(String? v) onChanged;
 String hintText;
 double? width;

 CalenderDropButton({Key? key,required this.initaldata,required this.list,required this.onChanged,required this.hintText,this.width}) : super(key: key);

  @override
  _CalenderDropButtonState createState() => _CalenderDropButtonState();
}

class _CalenderDropButtonState extends State<CalenderDropButton> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Material(
      elevation: 8,
      color: ColorManager.white,
      borderRadius: BorderRadius.circular(7),
      child: SizedBox(
        height: 44.0.h,
        width:0.2.sw ,
        child:  DropdownButton<String>(
          underline: Container(
            height: 0,
            color: ColorManager.grey,
          ),
          iconSize: 50,
          iconEnabledColor: ColorManager.grey,
          // isDense: true,
          isExpanded: true,
          icon: Icon(Icons.arrow_drop_down,size: FontSize.s22,color: ColorManager.grey),
          elevation: 16,
          hint:   Padding(
            padding:  const EdgeInsets.symmetric(horizontal: 10.0),
            child: RegularText(
                title: widget.hintText, titleColor: ColorManager.calenderTitle,titleSize: FontSize.s14),
          ),
          value: widget.initaldata,
          items: widget.list.map((String data) {
            return  DropdownMenuItem<String>(
              value: data,
              child:  Center(
                child: RegularText(
                    title: data, titleColor: ColorManager.calenderTitle,titleSize: FontSize.s16),
              ),
            );
          }).toList(),
          onChanged: ( data) => widget.onChanged(data),

        ),
      ),
    );
  }
}
