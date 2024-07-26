import 'package:flutter/material.dart';
import 'package:places/providers/great_places.dart';
import 'package:places/screens/place_form_screen.dart';
import 'package:places/screens/places_list_screen.dart';
import 'package:places/utils/app_routes.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Places',
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(
              primary: Colors.indigo,
              secondary: Colors.amber,
              seedColor: Colors.indigo),
          useMaterial3: false,
        ),
        routes: {
          AppRoutes.PLACE_FORM: (ctx) => const PlaceFormScreen(),
        },
        home: const PlacesListScreen(),
      ),
    );
  }
}
