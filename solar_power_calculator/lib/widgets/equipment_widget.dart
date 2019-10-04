import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:solar_power_calculator/scoped_models/energy_usage_model.dart';

class EquipmentWidget extends StatefulWidget {
  final String equipment;
  final double powerRating;
  final int index;
  final Function update;

  EquipmentWidget({this.equipment, this.powerRating, this.index, this.update});

  @override
  _EquipmentWidgetState createState() => _EquipmentWidgetState();
}

class _EquipmentWidgetState extends State<EquipmentWidget> {
  final List<String> watt = ['W', 'kW'];

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant(
      builder: (BuildContext context, Widget child, EnergyModel model) {
        return GestureDetector(
          onTap: () {
            setState(() {
              //model.deleteEnergyUsage(widget.index);
              model.selectIndex(widget.index);
              model.equipmentController.text =
                  model.selectedEnergyUsage.equipment;
              model.ratingController.text =
                  model.selectedEnergyUsage.powerRating.toString();
              model.quantityController.text =
                  model.selectedEnergyUsage.quantity.toString();
              model.hoursController.text =
                  model.selectedEnergyUsage.hoursUsedPerDay.toString();
              widget.update();
            });
          },
          onLongPress: () {
            setState(() {
             model.deleteEnergyUsage(widget.index); 
             widget.update();
            });
          },
          child: Container(
            margin: EdgeInsets.only(
              right: 14,
            ),
            padding: EdgeInsets.only(
              top: 8,
              bottom: 10.38,
              left: 8,
            ),
            width: 80,
            height: 68.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        '${widget.equipment.length > 6 ? widget.equipment[0] + '...' + widget.equipment[widget.equipment.length - 1] : widget.equipment}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF77869E),
                        ),
                      ),
                      // ScopedModelDescendant(
                      //   builder: (BuildContext context, Widget child,
                      //       EnergyModel model) {
                      //     return GestureDetector(
                      //       child: Icon(
                      //         Icons.edit,
                      //         size: 16,
                      //         color: Color(0xFF6737EF),
                      //       ),
                      //       onTap: () {
                      //         setState(() {
                      //           //model.deleteEnergyUsage(widget.index);
                      //           model.selectIndex(widget.index);
                      //           model.equipmentController.text =
                      //               model.selectedEnergyUsage.equipment;
                      //           model.ratingController.text = model
                      //               .selectedEnergyUsage.powerRating
                      //               .toString();
                      //           model.quantityController.text = model
                      //               .selectedEnergyUsage.quantity
                      //               .toString();
                      //           model.hoursController.text = model
                      //               .selectedEnergyUsage.hoursUsedPerDay
                      //               .toString();
                      //           widget.update();
                      //         });
                      //       },
                      //     );
                      //   },
                      // )
                    ],
                  ),
                ),
                Text(
                  '${widget.powerRating}W',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF042C5C)),
                ),
              ],
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.42),
              border: Border.all(color: Color(0xFF6737EF), width: 1),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0x23000000),
                  blurRadius: 13.68,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
