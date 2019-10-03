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

  Map<String, dynamic> get solarPowerReport {
    return _solarPowerReport;
  }

  void addRequirements(SolarRequirements requirement) {
    this.requirement = requirement;
  }

  void calculateReportValues() {
    _solarPowerReport['Inverter Capacity'] = (requirement.energyUsedPerDay / 0.8);
    _solarPowerReport['Energy Consumed'] = requirement.energyUsedPerDay;
    _solarPowerReport['Batteries Number'] = requirement.energyUsedPerDay /
        (requirement.batteryCapacity * requirement.batteryVoltage);
    _solarPowerReport['Panels Number'] = requirement.energyUsedPerDay/(requirement.solarPanelRating * requirement.sunshineHoursPerDay);
  }
}
