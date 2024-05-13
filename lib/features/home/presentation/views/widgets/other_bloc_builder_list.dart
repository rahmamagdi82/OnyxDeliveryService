import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ony_x_delivery_service/features/home/presentation/views/widgets/delivering_order_item.dart';
import 'package:ony_x_delivery_service/features/home/presentation/views/widgets/empty_widget.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../controller/get_bills_cubit.dart';
import 'delivered_order_item.dart';

class OtherBlocBuilderList extends StatelessWidget {
  const OtherBlocBuilderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetBillsCubit,GetBillsState>(
      builder: (BuildContext context, state) {
        if(state is GetBillsSuccess){
          return Expanded(child: ListView.builder(
              itemCount: state.bills.length,
              itemBuilder: (context,index){
                if(state.bills.isEmpty){
                  return const EmptyWidget();
                }
                else{
                  if(state.bills[index].billStatus=='1'){
                    return DeliveredOrderItem(bill: state.bills[index],);
                  }
                  else if(state.bills[index].billStatus=='2'){
                    return DeliveringOrderItem(bill: state.bills[index],);
                  }
                  else{
                    return const SizedBox();
                  }
                }
              }));
        }
        else if(state is GetBillsFailed){
          return Text(state.message);
        }
        else{
          return CircularProgressIndicator(color: ColorManager.primary,);
        }
      },
    );
  }
}
