import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/features/home/presentation/controller/get_bills_cubit.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'custom_app_bar.dart';
import 'delivered_order_item.dart';
import 'new_order_item.dart';

class HomeBodyViewWidget extends StatefulWidget {
  const HomeBodyViewWidget({Key? key, required this.user}) : super(key: key);
  final UserEntity user;
  @override
  State<HomeBodyViewWidget> createState() => _HomeBodyViewWidgetState();
}

class _HomeBodyViewWidgetState extends State<HomeBodyViewWidget> {
  final items = [
    "1",
    "2",
  ];
  List<String> selectedItem = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(user: widget.user,),
        // Row(
        //   children: items
        //       .map(
        //         (e) => Padding(
        //           padding: const EdgeInsets.only(top: 20),
        //           child: FilterChip(
        //               label: Text(e),
        //               selectedColor: ColorManager.primary,
        //               showCheckmark: false,
        //               backgroundColor: ColorManager.white,
        //               shape: selectedItem.contains(e)?
        //                   RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
        //                   :
        //               ( e=='1')?
        //               RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(22),bottomLeft: Radius.circular(22))):
        //               RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(22),bottomRight: Radius.circular(22))),
        //               selected: selectedItem.contains(e),
        //               onSelected: (bool value) {
        //                 if (!selectedItem.contains(e)) {
        //                   selectedItem.clear();
        //                   selectedItem.add(e);
        //                 }
        //                 setState(() {});
        //               }),
        //         ),
        //       )
        //       .toList(),
        // )

        BlocBuilder<GetBillsCubit,GetBillsState>(
            builder: (BuildContext context, state) {
              if(state is GetBillsSuccess){
                return Expanded(child: ListView.builder(
                  itemCount: state.bills.length,
                    itemBuilder: (context,index){
                    if(state.bills[index].billStatus=='0'){
                      return NewOrderItem(bill: state.bills[index],);
                    }
                    if(state.bills[index].billStatus=='1'){
                      return DeliveredOrderItem(bill: state.bills[index],);
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
        )
      ],
    );
  }
}
