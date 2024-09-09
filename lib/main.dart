import 'package:context_app/constants/colors.dart';
import 'package:context_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ContextApp());
}

class ContextApp extends StatelessWidget {
  const ContextApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        
      ),
      home: Scaffold(
        backgroundColor: AppColors.defaultBackground,
        appBar: AppBar(
          title: const Center(child: Text('CONTEXTO')),
          backgroundColor: AppColors.defaultBackground,
        ),
        body: HomeScreen(),
      ),
    );
  }
}
