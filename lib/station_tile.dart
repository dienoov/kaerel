import 'package:flutter/material.dart';
import 'package:kaerel/schedule_page.dart';
import 'package:kaerel/train_station.dart';

class StationTile extends StatelessWidget {
  final TrainStation station;

  StationTile(this.station);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(station.name),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SchedulePage(station),
            ),
          );
        },
      ),
    );
  }
}