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

  final focusNodePower = FocusNode();
  final focusNodeQuantity = FocusNode();
  final focusNodeHours = FocusNode();

  Widget _buildEquipmentField() {
    return TextFormField(
      textInputAction: TextInputAction.next,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(focusNodePower),
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        hintText: 'Appliances',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Appliances',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
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
      focusNode: focusNodePower,
      onEditingComplete: () =>
          FocusScope.of(context).requestFocus(focusNodeQuantity),
      textInputAction: TextInputAction.next,
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        suffixText: 'W',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Power Rating',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Power Rating',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
          return 'Please enter a valid input';
        }
        else if(double.parse(value) > 9999) {
          return 'Please enter a value less than 10000';
        }
        else if(value.length > 6) {
          return 'Please enter a value with a lesser decimal place';
        }
      },
      onSaved: (String value) {
        _formData['Power Rating'] = double.parse(value);
      },
    );
  }

  Widget _buildQuantityField() {
    return TextFormField(
      focusNode: focusNodeQuantity,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(focusNodeHours);
      },
      textInputAction: TextInputAction.next,
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
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Quantity',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^\d+$').hasMatch(value) || double.parse(value) <= 0) {
          return 'Please enter a valid input';
        }
        else if(int.parse(value) >= 100) {
          return 'Please enter a value less than 100';
        }
      },
      onSaved: (String value) {
        _formData['Quantity'] = int.parse(value);
      },
    );
  }

  Widget _buildHoursUsedField() {
    return TextFormField(
      focusNode: focusNodeHours,
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      keyboardType: TextInputType.numberWithOptions(),
      decoration: InputDecoration(
        suffixText: 'Hrs',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Hours Used',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Hours Used',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
          return 'Please enter a valid input';
        }
        else if(double.parse(value) > 24) {
          return 'Please enter a value less than or equal to 24';
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
            borderSide: BorderSide(color: Color(0xFF6737EF), width: 1),
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
          } else {
            Scaffold.of(context).showSnackBar(SnackBar(
              content: Text(
                'Complete the form and add an appliance before proceeding.',
                style: TextStyle(fontSize: 12),
              ),
              backgroundColor: Theme.of(context).primaryColor,
            ));
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
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, EnergyModel model) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                _buildEquipmentField(),
                _buildPowerRatingField(),
                _buildQuantityField(),
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
