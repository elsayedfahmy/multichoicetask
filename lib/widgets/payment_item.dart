// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:task/domain/model/payment_model.dart';
// import 'package:task/utilites/color_manager.dart';
// import 'package:task/utilites/string_manager.dart';
// import 'package:task/widgets/space.dart';
// import 'package:task/widgets/text/regular_text.dart';
//
// class PaymantItem extends StatefulWidget {
// final  PaymentItemModel paymentItemModel;
//   const PaymantItem({Key? key,required this.paymentItemModel}) : super(key: key);
//
//   @override
//   State<PaymantItem> createState() => _PaymantItemState();
// }
//
// class _PaymantItemState extends State<PaymantItem> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 4),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10),
//         color:ColorManager.white,
//       ),
//       child:  ExpansionTile(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceAround,
//             children: [
//               Expanded(
//                   flex: 2,
//                   child: Container(
//                     color: ColorManager.primary,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         RegularText(title: widget.paymentItemModel.fullNameAr.toString(),titleColor: ColorManager.primary),
//                         RegularText(title: widget.paymentItemModel.mobileNumber.toString(),titleColor: ColorManager.black),
//                       ],
//                     ),
//                   )),
//
//               Expanded(
//                   flex: 1,
//                   child: Container(
//                     color: ColorManager.primary,
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                       children: [
//                         RegularText(title: widget.paymentItemModel.amount.toString(),titleColor: ColorManager.error),
//                         RegularText(title: StringManager.rial.tr,titleColor: ColorManager.grey),
//                       ],
//                     ),
//                   )),
//             ],
//           ),
//       iconColor: ColorManager.transparent,
//       collapsedIconColor:ColorManager.transparent,
//       leading: Text('ss'),
//       trailing: Space(width: 0,height: 0),
//       children: [
//         Text('ffffffffffffffff'),
//         Text('ffffffffffffffff'),
//         Text('ffffffffffffffff'),
//         Text('ffffffffffffffff'),
//       ]),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/domain/model/payment_model.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/string_manager.dart';
import 'package:task/widgets/space.dart';
import 'package:task/widgets/text/regular_text.dart';

class PaymantItem extends StatefulWidget {
final  PaymentItemModel paymentItemModel;
  const PaymantItem({Key? key,required this.paymentItemModel}) : super(key: key);

  @override
  State<PaymantItem> createState() => _PaymantItemState();
}

class _PaymantItemState extends State<PaymantItem> {
  bool isExpanded=false;
  final double radiusAmount=8;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isExpanded=!isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6,),
        child: Column(
          children: [
            Container(
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                borderRadius:
                isExpanded?
                    BorderRadius.only(
                      topRight: Radius.circular(radiusAmount),
                      topLeft: Radius.circular(radiusAmount),
                    ):
                BorderRadius.circular(radiusAmount),
                color:ColorManager.white,
              ),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RegularText(title: widget.paymentItemModel.fullNameAr.toString(),titleColor: ColorManager.primary,titleSize: FontSize.s16),
                          RegularText(title: widget.paymentItemModel.mobileNumber.toString(),titleColor: ColorManager.black),
                        ],
                      )),

                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          RegularText(title: widget.paymentItemModel.amount.toString(),titleColor: ColorManager.error,titleSize: FontSize.s16),
                          RegularText(title: StringManager.rial.tr,titleColor: ColorManager.grey),
                        ],
                      )),
                ],
              ),
            ),
            if(isExpanded)
            Container(
              width: 1.0.sw,
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
              decoration: BoxDecoration(
                color:ColorManager.expanded,
                 borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(radiusAmount),
                    bottomRight: Radius.circular(radiusAmount),
                  )
              ),
              child:   Column(
                children: [
                  //------- trxRef Number
                  Row(
                    children: [
                      RegularText(title: StringManager.transferNumber.tr +' : ',titleColor: ColorManager.grey,titleSize: FontSize.s16),
                      RegularText(title: widget.paymentItemModel.trxRef.toString(), titleColor: ColorManager.text,titleSize: FontSize.s14),
                    ],
                  ),

                  //------- trxDate Number
                  Row(
                    children: [
                      RegularText(title: StringManager.transferDate.tr +' : ',titleColor: ColorManager.grey,titleSize: FontSize.s16),
                      RegularText(title: widget.paymentItemModel.trxDate.toString(), titleColor: ColorManager.text,titleSize: FontSize.s14),
                    ],
                  ),

                  //------- trxDate Number
                  Row(
                    children: [
                      RegularText(title: StringManager.facilityName.tr +' : ',titleColor: ColorManager.grey,titleSize: FontSize.s16),
                      RegularText(title: widget.paymentItemModel.fullNameAr.toString(), titleColor: ColorManager.primary,titleSize: FontSize.s14),
                    ],
                  ),
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }
}


