import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:places/utils/location_utils.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  String _previewImageUrl = '';

  Future<void> _getCurrentUserLocation() async {
    final localData = await Location().getLocation();

    final staticMapImageUrl = LocationUtils.generatedLocationPreviewImage(
        latitude: localData.latitude!, longitude: localData.longitude!);

    setState(() {
      _previewImageUrl = staticMapImageUrl;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          child: _previewImageUrl.isEmpty
              ? const Text('Localização não informada!')
              : Image.network(
                  _previewImageUrl,
                  fit: BoxFit.cover, // para ocupar todo o espaço
                  width: double.infinity,
                ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton.icon(
                icon: const Icon(Icons.location_on),
                onPressed: _getCurrentUserLocation,
                label: Text(
                  'Localização atual',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
            TextButton.icon(
                icon: const Icon(Icons.map),
                onPressed: () {},
                label: Text(
                  'Selecione no mapal',
                  style: TextStyle(color: Theme.of(context).primaryColor),
                )),
          ],
        )
      ],
    );
  }
}
