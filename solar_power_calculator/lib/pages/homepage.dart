import 'package:flutter/material.dart';
import 'package:solar_power_calculator/pages/energy_consumed_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: 67),
          Container(
            margin: EdgeInsets.only(left: 24),
            child: Text(
              'Solar Power Calculator',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Color(0xFF042C5C),
              ),
            ),
          ),
          SizedBox(height: 200),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 39),
            child: RaisedButton(
              onPressed: () {},
              padding: EdgeInsets.symmetric(vertical: 13),
              color: Color(0xFF6737EF),
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Generate solar power report',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                  Icon(
                    Icons.arrow_right,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 39),
            child: OutlineButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) => EnergyConsumedPage(),
                  ),);
              },
              padding: EdgeInsets.symmetric(vertical: 13),
              color: Color(0xFF6737EF),
              splashColor: Color(0xFF6737EF),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(
                    'Calculate energy usage per day',
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF6737EF),
                    ),
                  ),
                  Icon(Icons.arrow_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
