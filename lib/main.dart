import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod_task/utils/routes/app_routes_config.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_mvvm_riverpod_task/view/login_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // routeInformationParser: MyAppRouter().router.routeInformationParser,
      // routerDelegate: MyAppRouter().router.routerDelegate,
routerConfig: MyAppRouter().router,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}
