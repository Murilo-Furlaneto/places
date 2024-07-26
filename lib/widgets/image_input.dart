import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspaths;
import 'package:path/path.dart' as path;

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onSelectImage});

  final Function onSelectImage;

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File? _storedImage;

  Future<void> _takePicture() async {
    try {
      final ImagePicker picker = ImagePicker();
      XFile imageFile = await picker.pickImage(
        source: ImageSource.camera,
        maxWidth: 600,
      ) as XFile;

      setState(() {
        _storedImage = File(imageFile.path);
      });

      //final appDir = await syspaths.getApplicationCacheDirectory();
      //String fileName = path.basename(_storedImage!.path);
      //final savedImage = await _storedImage!.copy('${appDir.path}/$fileName');

      widget.onSelectImage(_storedImage);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 180,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey),
          ),
          alignment: Alignment.center,
          child: _storedImage != null
              ? Image.file(
                  _storedImage!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                )
              : const Text('Nenhuma imagem!'),
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: TextButton.icon(
            onPressed: () async {
              await _takePicture();
            },
            icon: const Icon(Icons.camera),
            label: const Text('Tirar foto'),
          ),
        )
      ],
    );
  }
}
