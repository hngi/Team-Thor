import 'package:flutter/material.dart';
import 'package:solar_power_calculator/widgets/calculate_solar_form.dart';

class CalculateSolarPage extends StatefulWidget {
  @override
  _CalculateSolarPageState createState() => _CalculateSolarPageState();
}

class _CalculateSolarPageState extends State<CalculateSolarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 24, top: 44),
              child: IconButton(
                alignment: Alignment.topLeft,
                icon: Icon(Icons.arrow_back),
                padding: EdgeInsets.all(0),
                onPressed: () => Navigator.pop(context),
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Container(
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 24),
              child: Text(
                'Enter Solar Requirements',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF042C5C),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            CalculateSolarForm(),
          ],
        ),
      ),
    );
  }
}
