import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import '../../../../themes.dart';
import '../controllers/home_controller.dart';

class MapView extends StatelessWidget {
  MapView({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return FlutterLocationPicker(
      showZoomController: false,
      showCurrentLocationPointer: false,
      showContributorBadgeForOSM: false,
      showLocationController: false,
      trackMyPosition: true,
      searchbarInputBorder:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      loadingWidget: LoadingAnimationWidget.staggeredDotsWave(
        color: whiteColor,
        size: 50,
      ),
      searchbarBorderRadius: BorderRadius.only(
        topLeft: Radius.circular(27),
        topRight: Radius.circular(27),
        bottomLeft: Radius.circular(27),
        bottomRight: Radius.circular(27),
      ),
      markerIcon: Icon(Icons.location_on, color: redColor, size: 50),
      selectLocationButtonPositionRight: -300.0,
      selectLocationButtonPositionBottom: 110.0,
      showSelectLocationButton: true,
      contributorBadgeForOSMTextColor: Colors.black,
      searchBarBackgroundColor: whiteColor,
      mapLoadingBackgroundColor: Colors.transparent,
      searchbarInputFocusBorderp:
          OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
      selectLocationButtonWidth: 90.0,
      selectLocationButtonStyle: ButtonStyle(
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
        ),
        // backgroundColor: MaterialStateProperty.all(Colors.blue),
        backgroundColor: MaterialStateProperty.all(Colors.blue),
      ),
      selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
      selectLocationButtonText: "",
      selectLocationButtonLeadingIcon: const Icon(Icons.check),
      initZoom: 10,
      minZoomLevel: 5,
      showSearchBar: true,
      maxZoomLevel: 16,
      onError: (e) => debugPrintStack(label: "sadasasdasd"),
      onPicked: (pickedData) async {
        await controller.fetchAirPollutionData(
            pickedData.latLong.latitude, pickedData.latLong.longitude);

        controller.lat.value = pickedData.latLong.latitude;
        controller.lon.value = pickedData.latLong.longitude;
      },
    );
  }
}
