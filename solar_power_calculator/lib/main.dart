import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/pages/energy_consumed_page.dart';
import 'package:solar_power_calculator/pages/homepage.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';
import 'package:solar_power_calculator/scoped_models/solar_requirements_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScopedModel(
      model: SolarRequirementsModel(),
      child: ScopedModel(
        model: EnergyModel(),
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ),
      ),
    );
  }
}
