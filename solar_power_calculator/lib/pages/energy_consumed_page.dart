import 'package:flutter/material.dart';

class EnergyConsumedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
              'Energy Consumed',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF042C5C),
              ),
            ),
          ),
          SizedBox(height: 31),
          Container(
            margin: EdgeInsets.only(
              left: 24,
            ),
            child: Row(
              children: <Widget>[
                Container(
                  width: 80,
                  height: 68.5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3.42),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x23000000),
                        blurRadius: 13.68,
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 14,),
                Container(
                  width: 80,
                  height: 68.5,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x23000000),
                        blurRadius: 13.68,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
