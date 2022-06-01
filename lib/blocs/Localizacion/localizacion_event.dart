part of 'localizacion_bloc.dart';

abstract class LocalizacionEvent extends Equatable {
  const LocalizacionEvent();

  @override
  List<Object> get props => [];
}

class EventGeoLocalizo extends LocalizacionEvent {
  final LatLng posicion;

  const EventGeoLocalizo(this.posicion);
}
