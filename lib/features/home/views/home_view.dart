import 'package:flutter/material.dart';
import 'package:ony_x_delivery_service/features/home/views/widgets/home_body_view_widget.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeBodyViewWidget(),
    );
  }
}
