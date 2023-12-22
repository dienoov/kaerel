import 'package:flutter/material.dart';
import 'package:kaerel/schedule_page.dart';
import 'package:kaerel/train_station.dart';

class StationTile extends StatelessWidget {
  final TrainStation station;

  StationTile(this.station);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shadowColor: Colors.transparent,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            station.name,
            style: const TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        subtitle: Text(station.address, style: const TextStyle(fontSize: 12.0)),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo[800],
          child: Text(
            station.name[0],
            style: const TextStyle(color: Colors.white),
          ),
        ),
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
