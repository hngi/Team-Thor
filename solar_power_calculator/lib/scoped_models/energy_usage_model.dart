import 'package:scoped_model/scoped_model.dart';

import '../models/energy_usage.dart';

class EnergyModel extends Model {
  List<EnergyUsage> _usages = [
    EnergyUsage(
      equipment: "Iron",
      powerRating: 2500,
      quantity: 1,
      hoursUsedPerDay: 2,
    ),
    EnergyUsage(
      equipment: "Bulb",
      powerRating: 11,
      quantity: 10,
      hoursUsedPerDay: 19,
    ),
    EnergyUsage(
      equipment: "Fan",
      powerRating: 75,
      quantity: 1,
      hoursUsedPerDay: 8,
    ),
    EnergyUsage(
      equipment: "Cooker",
      powerRating: 2000,
      quantity: 1,
      hoursUsedPerDay: 8,
    ),
    

  ];
  List get usages => List.from(_usages);
  int _selectedUsageIndex;
  double totalEnergyUsedPerDay = 0;

  void selectIndex(int index) {
    _selectedUsageIndex = index;
  }

  void addEnergyUsage(EnergyUsage usage) {
    _usages.add(usage);
  }

  void updateEnergyUsage(EnergyUsage usage) {
    _usages[_selectedUsageIndex] = usage;
  }

  void deleteEnergyUsage(int index) {
    _usages.removeAt(index);
  }

  void calculateTotalEnergyUsedPerDay() {
    for (int i = 0; i < _usages.length; i++) {
      totalEnergyUsedPerDay += (_usages[i].powerRating *
          _usages[i].quantity *
          _usages[i].hoursUsedPerDay);
    }
  }
}
