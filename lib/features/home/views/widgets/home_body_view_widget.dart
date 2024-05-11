import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/core/utils/resources/color_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/font_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/style_manager.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../gen/assets.gen.dart';
import 'custom_app_bar.dart';

class HomeBodyViewWidget extends StatefulWidget {
  const HomeBodyViewWidget({Key? key}) : super(key: key);

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
        const CustomAppBar(),
        Row(
          children: items
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: FilterChip(
                      label: Text(e),
                      selectedColor: ColorManager.primary,
                      showCheckmark: false,
                      backgroundColor: ColorManager.white,
                      shape: selectedItem.contains(e)?
                          RoundedRectangleBorder(borderRadius: BorderRadius.circular(22))
                          :
                      ( e=='1')?
                      RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(22),bottomLeft: Radius.circular(22))):
                      RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(22),bottomRight: Radius.circular(22))),
                      selected: selectedItem.contains(e),
                      onSelected: (bool value) {
                        if (!selectedItem.contains(e)) {
                          selectedItem.clear();
                          selectedItem.add(e);
                        }
                        setState(() {});
                      }),
                ),
              )
              .toList(),
        )
      ],
    );
  }
}
