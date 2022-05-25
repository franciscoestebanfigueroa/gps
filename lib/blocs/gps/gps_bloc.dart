import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gps_event.dart';
part 'gps_state.dart';

class GpsBloc extends Bloc<GpsEvent, GpsState> {
  GpsBloc() : super(const GpsState(isConected: false, permiso: false)) {
    on<EventConexion>((event, emit) {
      return emit(state.copyWith(conexion: event.conexion));
    });
    on<EventPermiso>((event, emit) => {
          print(event.permiso),
          state.copyWith(permiso: event.permiso),
        });
  }
}
