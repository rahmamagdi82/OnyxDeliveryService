import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/features/home/domain/entities/bill_entity.dart';
import 'package:ony_x_delivery_service/features/home/presentation/views/widgets/title_with_value_widget.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../../../../core/utils/resources/font_manager.dart';
import '../../../../../core/utils/resources/style_manager.dart';
import '../../../../../core/utils/resources/values_manager.dart';
import 'divider_widget.dart';

class DeliveringOrderItem extends StatelessWidget {
  const DeliveringOrderItem({Key? key, required this.bill}) : super(key: key);
  final BillEntity bill;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom:AppPadding.p16,left: AppPadding.p16,right: AppPadding.p16),
      child: Container(
        height: AppSize.s115,
        decoration: BoxDecoration(
            color: ColorManager.white,
            borderRadius: BorderRadius.circular(AppSize.s8),
            boxShadow:  [
              BoxShadow(
                  color: ColorManager.darkGray,
                  offset: const Offset(3,3),
                  blurRadius: 3
              ),
            ]
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:AppPadding.p16,left: AppPadding.p20),
                    child: Text('#${bill.billId}',style: FontStyles.getMediumStyle(fontSize: FontSize.s12).copyWith(color: ColorManager.darkGray),),
                  ),
                  Row(
                    children: [
                      const SizedBox(width: AppSize.s30,),
                      const Expanded(child: TitleWithValueWidget(title: 'Status', value: 'Delivering',)),
                      const DividerWidget(),
                      Expanded(child: TitleWithValueWidget(title: 'Total price', value: '${calculateTotal()} LE',)),
                      const DividerWidget(),
                      Expanded(child: TitleWithValueWidget(title: 'Date', value: bill.billDate,)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: AppSize.s10,),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
              height: AppSize.s115,
              width: AppSize.s44,
              decoration: BoxDecoration(
                  color: ColorManager.primary,
                  borderRadius: const BorderRadius.only(topRight: Radius.circular(AppSize.s8),bottomRight: Radius.circular(AppSize.s8))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Order Details',style: FontStyles.getRegularStyle(fontSize: FontSize.s8).copyWith(color: ColorManager.white),),
                  const SizedBox(height: AppSize.s8,),
                  Icon(Icons.arrow_forward_ios,color: ColorManager.white,size: AppSize.s14,)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  String calculateTotal(){
    double total = double.parse(bill.deliveryAmount) + double.parse(bill.taxAmount);
    return '${total.round()}';
  }
}
