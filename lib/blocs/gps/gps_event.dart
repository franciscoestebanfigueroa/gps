part of 'gps_bloc.dart';

abstract class GpsEvent extends Equatable {
  const GpsEvent();

  @override
  List<Object> get props => []; //compara objetos para saber si redibujar
}

class EventPermiso extends GpsEvent {
  final bool permiso;

  const EventPermiso(this.permiso);
}

class EventConexion extends GpsEvent {
  final bool conexion;

  const EventConexion(this.conexion);
}
