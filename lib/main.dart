import 'package:crud1/controller/apiServise_controller.dart';
import 'package:crud1/view/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ApiController(),),
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}