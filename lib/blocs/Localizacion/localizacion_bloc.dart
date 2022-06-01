import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'localizacion_event.dart';
part 'localizacion_state.dart';

class LocalizacionBloc extends Bloc<LocalizacionEvent, LocalizacionState> {
  LocalizacionBloc()
      : super(
          LocalizacionState(

              //myUbicacion:const  LatLng(0.0, 0.0), ahora pude ser nulo
              ),
        ) {
    _consultarPosicion();

    on<EventGeoLocalizo>((event, emit) {
      emit(state.copyWhit(myUbicacion: event.posicion, historialLocalizacion: [
        ...?state.historialLocalizacion,
        event.posicion
      ]));
    });
  }

  Future<void> _consultarPosicion() async {
    Geolocator.getPositionStream().listen((event) {
      add(EventGeoLocalizo(LatLng(event.latitude, event.longitude)));
      print('datos del falso geo ${event.latitude},${event.longitude}');
    });
  }
}
