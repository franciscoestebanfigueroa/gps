import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  late StreamSubscription streamSubscription;
  GpsBloc() : super(const GpsState(isConected: false, permiso: false)) {
    //LISTENER EN CONSTRUCTOR

    _init();

    on<EventConexion>((event, emit) {
      return emit(state.copyWith(conexion: event.conexion));
    });
    on<EventPermiso>((event, emit) => {
          print(event.permiso),
          emit(state.copyWith(permiso: event.permiso)),
        });
  }

  Future<void> _init() async {
    final permiso = await Geolocator.checkPermission();

    print('permiso ${permiso.index}');
    add(EventPermiso(permiso.index == 2 || permiso.index == 3 ? true : false));
    //state.copyWith(permiso: permiso.index == 1 ? true : false); mal hecho

    streamSubscription = Geolocator.getServiceStatusStream().listen((event) {
      print('estado location ${event.index}');
      add(EventConexion(event.index == 1 ? true : false));
      //state.copyWith(conexion: event.index == 1 ? true : false);//forma incorecta
    });
  }

  @override
  Future<void> close() {
    // TODO: cerrar listener
    streamSubscription.cancel();
    return super.close();
  }
}
