import 'package:flutter/material.dart';
import 'package:kaerel/station_tile.dart';
import 'package:kaerel/train_station.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<TrainStation> displayedStations = [];

  @override
  void initState() {
    super.initState();
    displayedStations = allStations;
  }

  void filterStations(String query) {
    query = query.toLowerCase();
    setState(() {
      displayedStations = allStations
          .where((station) => station.name.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jadwal MRT'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: filterStations,
              decoration: InputDecoration(
                hintText: 'Cari stasiun MRT...',
                prefixIcon: Icon(Icons.search),
              ),
            ),
            SizedBox(height: 16.0),
            Expanded(
              child: ListView.builder(
                itemCount: displayedStations.length,
                itemBuilder: (context, index) {
                  return StationTile(displayedStations[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
