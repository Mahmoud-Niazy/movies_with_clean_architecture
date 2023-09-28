import 'package:flutter/material.dart';
import 'package:movie/core/api_services/api_services.dart';
import 'package:movie/core/service_locator/service_locator.dart';
import 'package:movie/features/home/presentation/view/movies_screen.dart';



void main() {
  ServiceLocator().init();
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
        ),
      ),
      home: const MainMoviesScreen(),
    );
  }
}
