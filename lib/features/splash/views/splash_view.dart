import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/features/splash/views/widgets/splash_body_view_widget.dart';


class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SplashBodyViewWidget(),
    );
  }
}
