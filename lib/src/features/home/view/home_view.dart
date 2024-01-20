import 'package:fitness_app/src/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ));
    return const Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text('Home screen'),
      ),
    );
  }
}
