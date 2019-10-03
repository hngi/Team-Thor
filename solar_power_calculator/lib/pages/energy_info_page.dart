import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/pages/calculate_solar_page.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';

class EnergyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, EnergyModel model) {
          return SingleChildScrollView(
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
                    'Energy Info',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF042C5C),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 27, top: 45, right: 154),
                  child: Text(
                    'Your power usage per day is:',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFf9D9D9D),
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 60, bottom: 100, right: 100, left: 100),
                  height: 176.0,
                  width: 176.0,
                  alignment: Alignment.center,
                  child: Text(
                    '${(model.totalEnergyUsedPerDay / 1000).toString().length > 6 ? (model.totalEnergyUsedPerDay / 1000).toStringAsFixed(4 - (model.totalEnergyUsedPerDay / 1000).floor()) : (model.totalEnergyUsedPerDay / 1000)}kW',
                    style: TextStyle(
                      fontSize: 26.35,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF6737EF),
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0x236737EF),
                          blurRadius: 20.0,
                          spreadRadius: 13.0),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.bottomRight,
                  margin: EdgeInsets.only(
                    right: 24,
                  ),
                  child: OutlineButton(
                    borderSide: BorderSide(color: Color(0xFF6737EF), width: 1),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) =>
                              CalculateSolarPage(),
                        ),
                      );
                    },
                    padding: EdgeInsets.symmetric(vertical: 13, horizontal: 56),
                    color: Color(0xFF6737EF),
                    splashColor: Color(0xFF6737EF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      'Next',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF6737EF),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
