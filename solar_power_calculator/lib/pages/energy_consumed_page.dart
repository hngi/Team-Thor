import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';
import 'package:solar_power_calculator/widgets/energy_consumed_form.dart';
import 'package:solar_power_calculator/widgets/equipment_widget.dart';

class EnergyConsumedPage extends StatefulWidget {
  @override
  _EnergyConsumedPageState createState() => _EnergyConsumedPageState();
}

class _EnergyConsumedPageState extends State<EnergyConsumedPage> {
  void update() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F9),
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
              model.usages.isEmpty
                  ? Container(
                      height: 0,
                    )
                  : Container(
                      margin: EdgeInsets.only(
                        left: 24,
                      ),
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: model.usages.length,
                        itemBuilder: (BuildContext context, int index) {
                          return EquipmentWidget(
                            equipment: model.usages[index].equipment,
                            powerRating: model.usages[index].powerRating,
                            index: index,
                            update: update,
                          );
                        },
                      ),
                    ),
              SizedBox(
                height: 30,
              ),
              EnergyConsumedForm(update: update),
              SizedBox(
                height: 20,
              )
            ],
          ),
        );
      }),
    );
  }
}
