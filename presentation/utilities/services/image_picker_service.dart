import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerService {
  final BuildContext context;

  ImagePickerService(this.context);

  Future<XFile?> pickImage() async {
    final _picker = ImagePicker();
    final source = await _showDialog();
    final XFile? image = await _picker.pickImage(source: source);
    return image;
  }

  _showDialog() async {
    return showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: new Wrap(
            children: <Widget>[
              new ListTile(
                leading: new Icon(Icons.photo_library),
                title: new Text('Photo Library'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
              new ListTile(
                leading: new Icon(Icons.photo_camera),
                title: new Text('Camera'),
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              ),
            ],
          ),
        );
      },
    );
  }
}
