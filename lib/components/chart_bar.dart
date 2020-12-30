import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {
  final String dayWeek;
  final double value;
  final double percentage;

  ChartBar(this.dayWeek, this.value, this.percentage);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Container(
            height: 15,
            child: FittedBox(
                child: Text('${this.value.toStringAsFixed(2)}')
            ),
          ),
        ),
        SizedBox(height: 5),
        SizedBox(height: 5),
        Container(
          height: 60,
          width: 10,
          child:  Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 1.0
                  ),
                  // color: Colors.blue,
                  borderRadius: BorderRadius.circular(5)
                ),
              ),
              FractionallySizedBox(
                heightFactor: percentage,
                child: Container(
                  decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(5)
                  ),
                ),
              )
            ],
          ),
        ),
        Container(
          child: Text(this.dayWeek),
        ),
      ],
    );
  }
}
