import 'package:flutter/material.dart';
import 'package:task/utilites/color_manager.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Center(child: 
      CircularProgressIndicator(
    backgroundColor:ColorManager.primary,
    strokeWidth: 4,
    valueColor: AlwaysStoppedAnimation<Color>(ColorManager.grey),
    )
      );
  }
}


