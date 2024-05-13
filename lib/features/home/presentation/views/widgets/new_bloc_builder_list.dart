import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/resources/color_manager.dart';
import '../../controller/get_bills_cubit.dart';
import 'empty_widget.dart';
import 'new_order_item.dart';

class NewBlocBuilderList extends StatelessWidget {
  const NewBlocBuilderList({Key? key}) : super(key: key);

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
                  if(state.bills[index].billStatus=='0'){
                    return NewOrderItem(bill: state.bills[index],);
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
