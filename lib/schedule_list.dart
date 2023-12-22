import 'package:flutter/material.dart';

List<String> filterSchedule(List<String> schedule) {
  DateTime now = DateTime.now();
  return schedule
      .where((entry) {
        DateTime entryTime =
            DateTime.parse('${now.year}-${now.month}-${now.day} $entry');
        return entryTime.isAfter(now);
      })
      .take(8)
      .toList();
}

class ScheduleList extends StatelessWidget {
  final List<String> schedule;

  ScheduleList(this.schedule);

  @override
  Widget build(BuildContext context) {
    List<String> filteredSchedule = filterSchedule(schedule);
    DateTime now = DateTime.now();

    return ListView.builder(
      itemCount: filteredSchedule.length,
      itemBuilder: (context, index) {
        Duration duration = DateTime.parse(
                '${now.year}-${now.month}-${now.day} ${filteredSchedule[index]}')
            .difference(now);
        return Card(
          margin: const EdgeInsets.all(8.0),
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    filteredSchedule[index],
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: (duration.inMinutes <= 0)
                        ? const Text(
                            'Tiba',
                            style: TextStyle(
                              fontSize: 12.0,
                            ),
                          )
                        : Text(
                            'Tiba dalam ${duration.inMinutes} menit',
                            style: const TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                            ),
                          ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
