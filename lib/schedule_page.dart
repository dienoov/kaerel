import 'package:flutter/material.dart';
import 'package:kaerel/schedule_list.dart';
import 'package:kaerel/train_station.dart';

class SchedulePage extends StatelessWidget {
  final TrainStation station;

  SchedulePage(this.station);

  @override
  Widget build(BuildContext context) {
    String name = station.name;
    bool showBundaranHITab = name != 'Bundaran HI';
    bool showLebakBulusGrabTab = name != 'Lebak Bulus Grab';

    return DefaultTabController(
      length: showBundaranHITab && showLebakBulusGrabTab ? 2 : 1,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Jadwal $name'),
          bottom: TabBar(
            tabs: [
              if (showBundaranHITab) Tab(text: 'Bundaran HI'),
              if (showLebakBulusGrabTab) Tab(text: 'Lebak Bulus Grab'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            if (showBundaranHITab)
              ScheduleList(station.scheduleBundaranHI),
            if (showLebakBulusGrabTab)
              ScheduleList(station.scheduleLebakBulus),
          ],
        ),
      ),
    );
  }
}
