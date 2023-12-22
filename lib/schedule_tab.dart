import 'package:flutter/material.dart';

class ScheduleTab extends StatelessWidget {
  final List<dynamic> schedule;

  ScheduleTab(this.schedule);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: schedule.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(schedule[index]['time']),
          subtitle: Text('Train Type: ${schedule[index]['train_type']}'),
        );
      },
    );
  }
}