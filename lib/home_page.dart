import 'package:flutter/material.dart';
import 'package:kaerel/station_tile.dart';
import 'package:kaerel/train_station.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {
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
        title: const Text('MRT Jakarta',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )),
        backgroundColor: Colors.indigo[800],
        shadowColor: Colors.transparent,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.indigo[800],
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, bottom: 16.0, top: 8.0),
              width: double.infinity,
              child: SearchBar(
                hintText: 'Cari stasiun keberangkatan...',
                leading: const Icon(Icons.search, color: Colors.black),
                onChanged: filterStations,
                padding: const MaterialStatePropertyAll<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 16.0)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
            ),
            const SizedBox(height: 16.0),
            ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: displayedStations.length,
              itemBuilder: (context, index) {
                return StationTile(displayedStations[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}
