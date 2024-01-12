import 'package:fitness_app/src/router/router.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return MaterialApp.router(
    //   routerConfig: AppRouter().router,
    // );
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => throw Exception(),
            child: const Text("Throw Test Exception"),
          ),
        ),
      ),
    );
  }
}
