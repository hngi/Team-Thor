import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:solar_power_calculator/models/energy_usage.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/pages/energy_info_page.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';

class EnergyConsumedForm extends StatefulWidget {
  final Function update;

  EnergyConsumedForm({this.update});
  @override
  _EnergyConsumedFormState createState() => _EnergyConsumedFormState();
}

class _EnergyConsumedFormState extends State<EnergyConsumedForm> {
  Map<String, dynamic> _formData = {
    'Equipments': null,
    'Power Rating': null,
    'Quantity': null,
    'Hours Used': null,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEquipmentField() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: 'Equipments',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF77869E),
        ),
        labelText: 'Equipments',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty || value.runtimeType != String) {
          return 'Please enter a valid input';
        }
      },
      onSaved: (String value) {
        _formData['Equipment'] = value;
      },
    );
  }

  Widget _buildPowerRatingField() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        hintText: 'Power Rating',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF77869E),
        ),
        labelText: 'Power Rating',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty || !(num.parse(value) is num)) {
          return 'Please enter a valid input';
        }
      },
      onSaved: (String value) {
        _formData['Power Rating'] = double.parse(value);
      },
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        hintText: 'Quantity',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF77869E),
        ),
        labelText: 'Quantity',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty || !(int.parse(value) is int)) {
          return 'Please enter a valid input';
        }
      },
      onSaved: (String value) {
        _formData['Quantity'] = int.parse(value);
      },
    );
  }

  Widget _buildHoursUsedField() {
    return TextFormField(
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        hintText: 'Hours Used',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w700,
          color: Color(0xFF77869E),
        ),
        labelText: 'Hours Used',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w700,
        ),
      ),
      validator: (String value) {
        if (value.isEmpty || !(num.parse(value) is num)) {
          return 'Please enter a valid input';
        }
      },
      onSaved: (String value) {
        _formData['Hours Used'] = double.parse(value);
      },
    );
  }

  Widget _buildAddButton() {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, EnergyModel model) {
        return Container(
          child: OutlineButton(
            onPressed: () {
              setState(() {
                _submitForm(model.addEnergyUsage);
                widget.update();
              });
            },
            padding: EdgeInsets.symmetric(vertical: 13, horizontal: 56),
            color: Color(0xFF6737EF),
            splashColor: Color(0xFF6737EF),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: Text(
              'Add',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF6737EF),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildContinueButton(EnergyModel model) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          model.totalEnergyUsedPerDay = 0;
          if (model.usages.isNotEmpty) {
            model.calculateTotalEnergyUsedPerDay();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => EnergyInfoPage(),
              ),
            );
          }
        },
        padding: EdgeInsets.symmetric(vertical: 13, horizontal: 38),
        color: Color(0xFF6737EF),
        splashColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        child: Text(
          'Continue',
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ),
    );
  }

  void _submitForm(Function addEnergyUsage) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        addEnergyUsage(
          EnergyUsage(
              equipment: _formData['Equipment'],
              powerRating: _formData['Power Rating'],
              quantity: _formData['Quantity'],
              hoursUsedPerDay: _formData['Hours Used']),
        );
      });
      print('Submitted');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, EnergyModel model) {
        return Container(
          margin: EdgeInsets.only(right: 24, left: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildEquipmentField(),
                SizedBox(height: 5),
                _buildPowerRatingField(),
                SizedBox(height: 5),
                _buildQuantityField(),
                SizedBox(height: 5),
                _buildHoursUsedField(),
                SizedBox(height: 60),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      _buildAddButton(),
                      _buildContinueButton(model)
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
