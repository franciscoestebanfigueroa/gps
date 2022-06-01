import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps/blocs/Localizacion/localizacion_bloc.dart';

class Gps extends StatefulWidget {
  const Gps({Key? key}) : super(key: key);

  @override
  State<Gps> createState() => _GpsState();
}

class _GpsState extends State<Gps> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    final blocLocaliza = BlocProvider.of<LocalizacionBloc>(context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<LocalizacionBloc, LocalizacionState>(
        builder: (context, state) {
          return state.myUbicacion == null
              ? const Center(
                  child: Text('Cargando'),
                )
              : //Center(
              //  child: Text(
              //      'latitud : ${state.myUbicacion!.latitude} Longitud: ${state.myUbicacion!.longitude} '),
              //);

              GoogleMap(
                  myLocationEnabled: true,
                  mapType: MapType.hybrid,
                  initialCameraPosition: CameraPosition(
                    target: state.myUbicacion!,
                    zoom: 14.4746,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                );
        },
      ),
    );
  }
//  static const CameraPosition _kLake = CameraPosition(
//      bearing: 192.8334901395799,
//      target: LatLng(37.43296265331129, -122.08832357078792),
//      tilt: 59.440717697143555,
//      zoom: 19.151926040649414);
//
//   Future<void> _goToTheLake() async {
//    final GoogleMapController controller = await _controller.future;
//    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
//  }
}
