import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/font_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/style_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:ony_x_delivery_service/features/login/domain/entites/user_entity.dart';
import 'package:ony_x_delivery_service/gen/assets.gen.dart';
import 'package:svg_flutter/svg.dart';
import 'custom_app_bar.dart';
import 'new_bloc_builder_list.dart';
import 'other_bloc_builder_list.dart';

class HomeBodyViewWidget extends StatefulWidget {
  const HomeBodyViewWidget({Key? key, required this.user}) : super(key: key);
  final UserEntity user;
  @override
  State<HomeBodyViewWidget> createState() => _HomeBodyViewWidgetState();
}

class _HomeBodyViewWidgetState extends State<HomeBodyViewWidget> {
  final items = [
    "New",
    "Others",
  ];
  List<String> selectedItem = ["New",];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppBar(user: widget.user,),
        Padding(
          padding: const EdgeInsets.only(top:AppPadding.p16,bottom: AppPadding.p14),
          child: Container(
            height: AppSize.s35,
            decoration: BoxDecoration(
              color: Colors.white,
                borderRadius: BorderRadius.circular(AppSize.s22),
              boxShadow: [
                BoxShadow(
                  blurRadius: 3,
                  offset: const Offset(0,5),
                  color: ColorManager.darkGray
                )
              ]
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: items
                  .map(
                    (e) => FilterChip(
                        label: Text(e,style: FontStyles.getSemiBoldStyle().copyWith(color: selectedItem.contains(e)?ColorManager.white:null),),
                        labelPadding:const EdgeInsets.symmetric(horizontal: AppPadding.p39,vertical: AppPadding.p2),
                        selectedColor: ColorManager.primary,
                        showCheckmark: false,
                        backgroundColor: ColorManager.white,
                        shape: selectedItem.contains(e)?
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
                            :
                        ( e=='New')?
                        const RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(AppSize.s22),bottomLeft: Radius.circular(AppSize.s22))):
                        const RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(AppSize.s22),bottomRight: Radius.circular(AppSize.s22))),
                        selected: selectedItem.contains(e),
                        onSelected: (bool value) {
                          if (!selectedItem.contains(e)) {
                            selectedItem.clear();
                            selectedItem.add(e);
                          }
                          setState(() {});
                        }),
                  )
                  .toList(),
            ),
          ),
        ),
        if(selectedItem.contains('New'))
          const NewBlocBuilderList(),
        if(selectedItem.contains('Others'))
          const OtherBlocBuilderList(),
      ],
    );
  }
}
