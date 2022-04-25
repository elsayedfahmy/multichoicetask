import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:task/data/payment_provider.dart';
import 'package:task/domain/model/payment_model.dart';
import 'package:task/presentation/drawer/app_drawer.dart';

import 'package:task/presentation/payment_view/payment_data.dart';
import 'package:task/utilites/color_manager.dart';
import 'package:task/utilites/font_manager.dart';
import 'package:task/utilites/image_manager.dart';
import 'package:task/utilites/responsive_manager.dart';
import 'package:task/utilites/string_manager.dart';
import 'package:task/widgets/loadin_widget.dart';
import 'package:task/widgets/payment_item.dart';
import 'package:task/widgets/space.dart';
import 'package:task/widgets/text/regular_text.dart';
import 'package:task/widgets/text/semi_bold_text.dart';


class PaymentView extends StatefulWidget {
  const PaymentView({Key? key}) : super(key: key);

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> with PaymentData{
  @override
  void initState() {
    super.initState();

    getData(context: context);
  }
  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:ColorManager.backgroundColor ,
        drawer:AppDrawer(),
      appBar: AppBar(
        title:   RegularText(title: StringManager.halaPayment.tr,titleColor: ColorManager.primary,titleSize: FontSize.s16),
        backgroundColor:ColorManager.backgroundColor ,
        shadowColor: ColorManager.backgroundColor ,
        elevation: 0,
        leading:   Builder(
          builder: (BuildContext context) {
            return Padding(
                padding:  const EdgeInsets.symmetric(horizontal: 10),
                child: InkWell(
                  onTap: (){
                    Scaffold.of(context).openDrawer();
                  },
                  child:   Icon(Icons.menu,color: ColorManager.primary,size: FontSize.s22),
                )


              // IconButton(
              //   icon:  Icon(Icons.menu,size: 30,color: AppColors.kBlackColor,),
              //   onPressed: () {
              //     Scaffold.of(context).openEndDrawer();
              //     // _drawerController.open!();
              //   },
              //   tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              // ),
            );
          },
        ),
      ),
      body:  LoadingWidget(
        isLoading: context.watch<PaymentProvider>().isLoading,
        child: Container(
          height: 1.0.sh,
          width: 1.0.sw,
          padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 4),
          decoration:  BoxDecoration(
            color:ColorManager.backgroundColor ,
              // image:const DecorationImage(
              //   image: AssetImage(ImageManager.splashBackground,),
              //   fit: BoxFit.fill,
              // )
          ),
          child:
          context.read<PaymentProvider>().halaPaymentModel==null?const Space(width: 0,):
          NotificationListener(
            onNotification: onNotification,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                SliverList(
                  delegate: SliverChildListDelegate(
                    [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                             Container(
                               width: 0.8.sw,
                               height: 44.0.h,
                               padding: const EdgeInsets.symmetric(horizontal: 8),
                               decoration:  BoxDecoration(
                                 borderRadius: BorderRadius.circular(8),
                                 color:ColorManager.yellow ,),
                               child:Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   SemiBoldText(title: StringManager.totalPayments.tr,titleColor: ColorManager.green,titleSize: FontSize.s16),
                                  Row(
                                    children: [
                                      SemiBoldText(title: context.watch<PaymentProvider>().halaPaymentModel!.totalRecords.toString()+' ',
                                          titleColor: ColorManager.green,titleSize: FontSize.s18),
                                      RegularText(title: StringManager.rial.tr,titleColor: ColorManager.green,titleSize: FontSize.s12),
                                    ],
                                  )
                                 ],
                               ) ,
                          ),
                          InkWell(
                            onTap: ()=>showCalender(context: context),
                            child: Container(
                              width: 0.12.sw,
                              height: 44.0.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: ColorManager.white,
                              ),
                              child:  Center(child: Icon(Icons.filter_alt_rounded,color: ColorManager.primary,size: FontSize.s18)),
                            ),
                          ),

                        ],
                      ),
                      const Space(height: 6,)
                    ]
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final PaymentItemModel _paymentItemModel=context.watch<PaymentProvider>().halaPaymentModel!.data![index];
                      return PaymantItem(paymentItemModel:_paymentItemModel );
                    },
                    childCount: context.watch<PaymentProvider>().halaPaymentModel!.data!.length,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
