import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/core/utils/resources/values_manager.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Container(
        color: const Color(0xffC7C7C7),
        height: AppSize.s48,
        width: 1,
      ),
    );
  }
}
