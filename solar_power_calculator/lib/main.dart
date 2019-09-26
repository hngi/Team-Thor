import 'package:flutter/material.dart';
import 'package:solar_power_calculator/pages/energy_consumed_page.dart';
import 'package:solar_power_calculator/pages/homepage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

