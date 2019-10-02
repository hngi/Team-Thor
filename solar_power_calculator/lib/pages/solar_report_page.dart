import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:share/share.dart';
import 'package:solar_power_calculator/pages/homepage.dart';
import 'package:solar_power_calculator/scoped_models/solar_requirements_model.dart';
import 'package:solar_power_calculator/widgets/report_widget.dart';

class SolarReportPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: ScopedModelDescendant(
        builder:
            (BuildContext context, Widget child, SolarRequirementsModel model) {
          return Column(
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
                  'Solar Power Report',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF042C5C),
                  ),
                ),
              ),
              SizedBox(height: 43),
              Container(
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ReportWidget(
                          title: 'Energy consumed per day',
                          value: model.solarPowerReport['Energy Consumed'],
                          unit: 'kW',
                        ),
                        SizedBox(width: 20),
                        ReportWidget(
                          title:
                              'Number of ${model.requirement.batteryVoltage}V batteries',
                          value: model.solarPowerReport['Batteries Number']
                                      .ceil() ==
                                  0
                              ? 1
                              : model.solarPowerReport['Batteries Number']
                                  .ceil(),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        ReportWidget(
                          title: 'Inverter Capacity',
                          value: model.solarPowerReport['Inverter Capacity'],
                          unit: 'kVA',
                        ),
                        SizedBox(width: 20),
                        ReportWidget(
                          title:
                              'Number of ${model.requirement.solarPanelRating}W solar panels',
                          value: model.solarPowerReport['Panels Number']
                                      .ceil() ==
                                  0
                              ? 1
                              : model.solarPowerReport['Panels Number'].ceil(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 45),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: OutlineButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => HomePage(),
                            ),
                          );
                        },
                        borderSide:
                            BorderSide(color: Color(0xFF6737EF), width: 1),
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 42),
                        color: Color(0xFF6737EF),
                        splashColor: Color(0xFF6737EF),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Close',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF6737EF),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: SizedBox(),
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          Share.share('Solar Power Report\n\n\n' +
                              'Energy used per day: ${model.solarPowerReport['Energy Consumed']} kW\n\n' +
                              'Inverter capacity: ${model.solarPowerReport['Inverter Capacity']} kVA\n\n' +
                              'Number of ${model.requirement.solarPanelRating}W solar panels: ${model.solarPowerReport['Panels Number'].ceil() == 0 ? 1 : model.solarPowerReport['Panels Number'].ceil()}\n\n' +
                              'Number of ${model.requirement.batteryVoltage}V batteries: ${model.solarPowerReport['Batteries Number'].ceil() == 0 ? 1 : model.solarPowerReport['Batteries Number'].ceil()}');
                        },
                        padding:
                            EdgeInsets.symmetric(vertical: 13, horizontal: 40),
                        color: Color(0xFF6737EF),
                        splashColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          'Share',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      )),
    );
  }
}
