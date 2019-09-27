import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';

class EnergyInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScopedModelDescendant(
        builder: (BuildContext context, Widget child, EnergyModel model) {
          return Column(
            children: <Widget>[
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 24, top: 44),
                child: Icon(Icons.arrow_back),
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
                    top: 60, bottom: 80, right: 100, left: 100),
                height: 176.0,
                width: 176.0,
                alignment: Alignment.center,
                child: Text(
                  '${(model.totalEnergyUsedPerDay / 1000)}kW',
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
                      spreadRadius: 13.0
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.bottomRight,
                margin: EdgeInsets.only(right: 24, ),
                child: OutlineButton(
                  onPressed: () {},
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
          );
        },
      ),
    );
  }
}
