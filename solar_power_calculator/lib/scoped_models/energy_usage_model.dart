import 'package:scoped_model/scoped_model.dart';

import '../models/energy_usage.dart';

class EnergyModel extends Model {
  List<EnergyUsage> _usages  = [];
  int _selectedIndex;
  double totalEnergyUsedPerDay;
  
  void selectIndex(int index) {
    _selectedIndex = index;
  }

  void addEnergyUsage(EnergyUsage usage) {
    _usages.add(usage);
  }

  void _updateEnergyUsage(EnergyUsage usage) {
    _usages[_selectedIndex] = usage;
  }

  void _deleteEnergyUsage(int index) {
    _usages.removeAt(index);
  }

  void calculateTotalEnergyUsedPerDay() {
    for(int i = 0; i < _usages.length; i++) {
      totalEnergyUsedPerDay += (_usages[i].powerRating * _usages[i].quantity * _usages[i].hoursUsedPerDay);
    }
  }

}