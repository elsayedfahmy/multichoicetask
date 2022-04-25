

import 'package:flutter/cupertino.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/widgets/circular_progress_indicator.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget child;
  final bool isLoading;
  const LoadingWidget({Key? key, this.width,this.height,required this.child,required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height??1.0.sh,
      width: width??1.0.sw,
      child: Stack(
        children: [
          child,
          if(isLoading)
          const AppCircularProgressIndicator()
        ],
      ),
    );
  }
}
