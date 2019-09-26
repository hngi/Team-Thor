import 'package:scoped_model/scoped_model.dart';

import 'package:solar_power_calculator/models/solar_requirements.dart';
class SolarRequirementsModel extends Model {
  SolarRequirements requirement;
  Map<String, dynamic> _solarPowerReport = {
    "Energy Consumed": null,
    "Inverter Capacity": null,
    "Batteries Number": null,
    "Panels Number": null
  };

  void addRequirements(SolarRequirements requirement) {
    this.requirement = requirement;
  }
}