import 'package:flutter/material.dart';
import 'package:shoping_pp/config/root/app_root.dart';
import 'package:shoping_pp/config/root/on_generate_root.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shopping',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRoot.home,
      onGenerateRoute: OnGenerateRoot.onGenerateRoute,
    );
  }
}
