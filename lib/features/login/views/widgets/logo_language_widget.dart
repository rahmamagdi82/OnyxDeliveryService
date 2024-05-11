import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

import '../../../../core/utils/resources/color_manager.dart';
import '../../../../core/utils/resources/values_manager.dart';
import '../../../../gen/assets.gen.dart';

class LogoLanguageWidget extends StatelessWidget {
  const LogoLanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppPadding.p26,right: AppPadding.p16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.images.logo,width: AppSize.s170,height: AppSize.s75,),
          const Spacer(),
          IconButton(
              alignment: Alignment.topRight,
              padding: EdgeInsets.zero,
              onPressed: (){}, icon: Icon(Icons.language,color: ColorManager.white,))
        ],
      ),
    );
  }
}
