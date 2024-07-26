// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:places/models/place_location.dart';

class Place {
  final String id;
  final String title;
  final PlaceLocation location;
  final File image;
  
  
  Place({
    required this.id,
    required this.title,
    required this.location,
    required this.image,
  });
}
