import 'package:flutter/material.dart';
import 'package:movie/core/api_services/api_services.dart';
import 'package:movie/core/service_locator/service_locator.dart';

import 'features/home/presentation/view/movies_screen.dart';

void main() {
  ServiceLocator().init();
  ApiServices.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainMoviesScreen(),
    );
  }
}
