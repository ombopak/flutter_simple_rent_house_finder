import 'package:flutter/material.dart';
import 'package:bwacozy_dewveloper/ui/pages/pages.dart';
import 'package:provider/provider.dart';
import 'package:bwacozy_dewveloper/providers/space_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
      
    ),
    );
  }
}