import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class LocationTracker extends StatefulWidget {
  const LocationTracker({Key? key}) : super(key: key);

  @override
  _LocationTrackerState createState() => _LocationTrackerState();
}

class _LocationTrackerState extends State<LocationTracker> {
  bool _isEditingText = false;
  late TextEditingController _editingController;
  String initialText = "Set Your Location";

  String location = 'Null';
  String Address = '';

  Future<Position> _getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  Future<void> GetAddressFromLatLong(Position position) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    print(placemarks);
    Placemark place = placemarks[0];
    Address =
        '${place.street},${place.locality},${place.administrativeArea},${place.country}';

    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getAddress();
    super.initState();
    // _editingController = TextEditingController(text: initialText);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _editingController.dispose();
    super.dispose();
  }

  Widget _editTitleTextField() {
    if (_isEditingText)
      return Center(
        child: TextField(
          onSubmitted: (newValue) {
            setState(() {
              initialText = newValue;
              _isEditingText = false;
            });
          },
          autofocus: true,
          controller: TextEditingController(text: Address),
          keyboardType: TextInputType.streetAddress,
          obscureText: false,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.location_on,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context)),
            focusedBorder: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context)),
            enabledBorder: OutlineInputBorder(
                borderSide: Divider.createBorderSide(context)),
            hintText: 'Location',
            filled: true,
            contentPadding: EdgeInsets.all(8),
          ),
        ),
      );
    return InkWell(
      onTap: () {
        setState(() {
          _isEditingText = true;
        });
      },
      child: TextField(
        autofocus: true,
        controller: TextEditingController(text: Address),
        keyboardType: TextInputType.streetAddress,
        obscureText: false,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.location_on,
            color: Colors.grey,
          ),
          border:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          focusedBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          enabledBorder:
              OutlineInputBorder(borderSide: Divider.createBorderSide(context)),
          hintText: 'Detecting . . .',
          filled: true,
          contentPadding: EdgeInsets.all(8),
        ),
      ),
      // Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 10),
      //   decoration: BoxDecoration(),
      //   child: Text(
      //     initialText,
      //     style:
      //         TextStyle(color: Colors.black, fontSize: 16.0, letterSpacing: 1),
      //   ),
      // ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _editTitleTextField();
  }

  Future<void> getAddress() async {
    Position position = await _getGeoLocationPosition();
    location = 'Lat: ${position.latitude} , Long: ${position.longitude}';
    GetAddressFromLatLong(position);
  }
}
