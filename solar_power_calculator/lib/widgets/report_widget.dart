import 'package:flutter/material.dart';

class ReportWidget extends StatelessWidget {
  final String title;
  final num value;
  final String unit;

  ReportWidget({this.title, this.value, this.unit = ''});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxHeight: 140,
        maxWidth: 160,
      ),
      padding: EdgeInsets.only(left: 11),
      width: 150,
      height: 114,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x23000000),
              blurRadius: 13.68,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 11),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF77869E),
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(height: 13),
          Text(
            '${value.toString().length > 5 ? value.toStringAsFixed(5 - value.floor().toString().length) : value.toString()} $unit',
            style: TextStyle(
                fontSize: 24,
                color: Color(0xFF042C5C),
                fontWeight: FontWeight.w700),
          ),
          Flexible(
            child: SizedBox(
              height: 24,
            ),
          )
        ],
      ),
    );
  }
}
