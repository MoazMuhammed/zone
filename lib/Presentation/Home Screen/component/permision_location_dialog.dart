import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationPermissionDialog extends StatelessWidget {
  final Function onPermissionGranted;

  LocationPermissionDialog({required this.onPermissionGranted});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Location Permission Required'),
      content: Text('This app requires access to your location. Please grant location permission to continue.'),
      actions: <Widget>[
        TextButton(
          onPressed: () async {
            Navigator.of(context).pop(); // Close the dialog
            PermissionStatus status = await Permission.location.request();
            if (status.isGranted) {
              // Location permission granted, execute callback
              onPermissionGranted();
            }
          },
          child: Text('Grant Permission'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Cancel'),
        ),
      ],
    );
  }
}
