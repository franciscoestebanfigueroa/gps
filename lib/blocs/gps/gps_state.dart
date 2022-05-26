part of 'gps_bloc.dart';

class GpsState extends Equatable {
  final bool permiso;
  final bool isConected;
  const GpsState({required this.permiso, required this.isConected});

  GpsState copyWith({bool? permiso, bool? conexion}) {
    return GpsState(
        permiso: permiso ?? this.permiso, isConected: conexion ?? isConected);
  }

  @override
  List<Object> get props =>
      [permiso, isConected]; //compara objetos para saber si dibujar

  @override
  String toString() {
    return ('permiso: $permiso ,conexion: $isConected');
  }
}
