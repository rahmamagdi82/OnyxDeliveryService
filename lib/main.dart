import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/utils/router_manager.dart';
import 'features/splash/views/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.montserratTextTheme()
      ),
    );
  }
}
