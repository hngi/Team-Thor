import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/models/solar_requirements.dart';
import 'package:solar_power_calculator/pages/solar_report_page.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';
import 'package:solar_power_calculator/scoped_models/solar_requirements_model.dart';

class CalculateSolarForm extends StatefulWidget {
  @override
  _CalculateSolarFormState createState() => _CalculateSolarFormState();
}

class _CalculateSolarFormState extends State<CalculateSolarForm> {
  Map<String, dynamic> _formData = {
    'Energy Perday': null,
    'Battery Capacity': null,
    'Battery Voltage': null,
    'Panel Rating': null,
    'Sunshine Hours': null,
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final focusNodeCapacity = FocusNode();
  final focusNodeVoltage = FocusNode();
  final focusNodeRating = FocusNode();
  final focusNodeHours = FocusNode();

  Widget _buildEnergyPerdayField(EnergyModel model) {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(focusNodeCapacity);
      },
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixText: 'kW',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Energy used per day',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Energy used per day',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^[+]?([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
          return 'Please enter a valid input';
        }
        else if(double.parse(value) > 9999) {
          return 'Please enter a value less than 10000';
        }
        else if(value.length > 6) {
          return 'Please enter a value with a lesser decimal place';
        }
      },
      initialValue: model.totalEnergyUsedPerDay == 0
          ? ''
          : '${model.totalEnergyUsedPerDay / 1000}',
      onSaved: (String value) {
        _formData['Energy Perday'] = double.parse(value);
      },
    );
  }

  Widget _buildBatteryCapacityField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      focusNode: focusNodeCapacity,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(focusNodeVoltage);
      },
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixText: 'AH',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Battery capacity',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Battery capacity',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^[+]?([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
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
        _formData['Battery Capacity'] = double.parse(value);
      },
    );
  }

  Widget _buildBatteryVoltageField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      focusNode: focusNodeVoltage,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(focusNodeRating);
      },
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixText: 'V',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Battery voltage',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Battery voltage',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^[+]?([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
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
        _formData['Battery Voltage'] = double.parse(value);
      },
    );
  }

  Widget _buildPanelRatingField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      focusNode: focusNodeRating,
      textInputAction: TextInputAction.next,
      onEditingComplete: () {
        FocusScope.of(context).requestFocus(focusNodeHours);
      },
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixText: 'W',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Solar panel rating',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Solar panel rating',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^[+]?([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
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
        _formData['Panel Rating'] = double.parse(value);
      },
    );
  }

  Widget _buildSunshineHoursField() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(),
      focusNode: focusNodeHours,
      style: TextStyle(
        fontSize: 16,
        color: Color(0xFF042C5C),
        fontWeight: FontWeight.w600,
      ),
      decoration: InputDecoration(
        suffixText: 'Hrs',
        suffixStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        hintText: 'Hours of sunshine per day',
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF77869E),
        ),
        labelText: 'Hours of sunshine per day',
        labelStyle: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
      validator: (String value) {
        if (!RegExp(r'^[+]?([.]\d+|\d+[.]?\d*)$').hasMatch(value) || double.parse(value) <= 0) {
          return 'Please enter a valid input';
        }
        else if(double.parse(value) > 24) {
          return 'Please enter a value less than or equal to 24';
        }
         else if(value.length > 6) {
          return 'Please enter a value with a lesser decimal place';
        }
      },
      onSaved: (String value) {
        _formData['Sunshine Hours'] = double.parse(value);
      },
    );
  }

  void _submitForm(Function addRequirements, SolarRequirementsModel model) {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      setState(() {
        addRequirements(
          SolarRequirements(
              energyUsedPerDay: _formData['Energy Perday'],
              batteryCapacity: _formData['Battery Capacity'],
              batteryVoltage: _formData['Battery Voltage'],
              solarPanelRating: _formData['Panel Rating'],
              sunshineHoursPerDay: _formData['Sunshine Hours']),
        );
        model.calculateReportValues();
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => SolarReportPage(),
        ),
      );
    }
  }

  Widget _buildSubmitButton(SolarRequirementsModel model) {
    return Container(
      child: RaisedButton(
        onPressed: () {
          _submitForm(model.addRequirements, model);
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

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder:
          (BuildContext context, Widget child, SolarRequirementsModel model) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                ScopedModelDescendant(
                  builder: (BuildContext context, Widget child,
                      EnergyModel energyModel) {
                    return _buildEnergyPerdayField(energyModel);
                  },
                ),
                _buildBatteryCapacityField(),
                _buildBatteryVoltageField(),
                _buildPanelRatingField(),
                _buildSunshineHoursField(),
                SizedBox(
                  height: 60,
                ),
                _buildSubmitButton(model),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
