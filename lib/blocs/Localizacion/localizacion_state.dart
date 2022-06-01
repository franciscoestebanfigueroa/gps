part of 'localizacion_bloc.dart';

class LocalizacionState extends Equatable {
  final LatLng? myUbicacion;
  final List<LatLng>? historialLocalizacion;
  final bool seguir;

  LocalizacionState copyWhit({
    LatLng? myUbicacion,
    List<LatLng>? historialLocalizacion,
  }) {
    return LocalizacionState(
        myUbicacion: myUbicacion ?? this.myUbicacion,
        xhistorialLocalizacion:
            historialLocalizacion ?? this.historialLocalizacion);
  }

  LocalizacionState({
    this.seguir = false,
    this.myUbicacion,
    xhistorialLocalizacion,
  }) : historialLocalizacion = xhistorialLocalizacion ?? [];

  @override
  List<Object?> get props => [myUbicacion, historialLocalizacion];
}
