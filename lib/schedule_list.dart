import 'package:flutter/material.dart';

List<String> filterSchedule(List<String> schedule) {
  DateTime now = DateTime.now();
  return schedule
      .where((entry) {
    DateTime entryTime = DateTime.parse('${now.year}-${now.month}-${now.day} $entry');
    return entryTime.isAfter(now);
  })
      .take(10)
      .toList();
}

class ScheduleList extends StatelessWidget {
  final List<String> schedule;

  ScheduleList(this.schedule);

  @override
  Widget build(BuildContext context) {
    List<String> filteredSchedule = filterSchedule(schedule);

    return ListView.builder(
      itemCount: filteredSchedule.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(filteredSchedule[index]),
        );
      },
    );
  }
}