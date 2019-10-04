import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../models/energy_usage.dart';

class EnergyModel extends Model {
  List<EnergyUsage> _usages = [];
  List get usages => List.from(_usages);
  int _selectedUsageIndex;
  double totalEnergyUsedPerDay = 0;

  int get selectedUsageIndex {
    return _selectedUsageIndex;
  }

  var equipmentController = TextEditingController();
  var ratingController = TextEditingController();
  var quantityController = TextEditingController();
  var hoursController = TextEditingController();

  void selectIndex(int index) {
    _selectedUsageIndex = index;
  }

  EnergyUsage get selectedEnergyUsage {
    return _usages[_selectedUsageIndex];
  }

  void addEnergyUsage(EnergyUsage usage) {
    _usages.add(usage);
  }

  void updateEnergyUsage(EnergyUsage usage) {
    _usages[_selectedUsageIndex] = usage;
    _selectedUsageIndex = null;
  }

  void deleteEnergyUsage(int index) {
    _usages.removeAt(index);
    _selectedUsageIndex = null;
  }

  void calculateTotalEnergyUsedPerDay() {
    for (int i = 0; i < _usages.length; i++) {
      totalEnergyUsedPerDay += (_usages[i].powerRating *
          _usages[i].quantity *
          _usages[i].hoursUsedPerDay);
    }
  }
}
