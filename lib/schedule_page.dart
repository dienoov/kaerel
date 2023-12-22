import 'package:flutter/material.dart';
import 'package:kaerel/schedule_list.dart';
import 'package:kaerel/train_station.dart';

class SchedulePage extends StatelessWidget {
  final TrainStation station;

  SchedulePage(this.station);

  @override
  Widget build(BuildContext context) {
    bool showBundaranHITab = station.name != 'Bundaran HI';
    bool showLebakBulusGrabTab = station.name != 'Lebak Bulus Grab';

    return DefaultTabController(
      length: showBundaranHITab && showLebakBulusGrabTab ? 2 : 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text(station.name,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600)),
          bottom: TabBar(
            tabs: [
              if (showBundaranHITab) const Tab(text: 'Bundaran HI'),
              if (showLebakBulusGrabTab) const Tab(text: 'Lebak Bulus Grab'),
            ],
          ),
          backgroundColor: Colors.indigo[800],
          centerTitle: true,
        ),
        body: TabBarView(
          children: [
            if (showBundaranHITab) ScheduleList(station.scheduleBundaranHI),
            if (showLebakBulusGrabTab) ScheduleList(station.scheduleLebakBulus),
          ],
        ),
      ),
    );
  }
}
