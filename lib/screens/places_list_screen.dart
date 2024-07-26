import 'package:flutter/material.dart';
import 'package:places/providers/great_places.dart';
import 'package:places/utils/app_routes.dart';
import 'package:provider/provider.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meus Lugares'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.PLACE_FORM);
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<GreatPlaces>(context, listen: false).loadPlaces(),
        builder: (context, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? const Center(child: CircularProgressIndicator())
            : Consumer<GreatPlaces>(
                child: const Center(
                  child: Text('Nenhum local cadastrado'),
                ),
                builder: (context, greatPlaces, child) =>
                    greatPlaces.itemsCount == 0
                        ? const Center(child: CircularProgressIndicator())
                        : ListView.builder(
                            itemCount: greatPlaces.itemsCount,
                            itemBuilder: (cxt, i) => ListTile(
                                  leading: CircleAvatar( 
                                    backgroundImage: FileImage(
                                        greatPlaces.itemByIndex(i).image),
                                  ),
                                  title: Text(greatPlaces.itemByIndex(i).title),
                                  onTap: () {},
                                ))),
      ),
    );
  }
}
