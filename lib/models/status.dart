class Status {
  final bool permiso;
  final bool conexion;

  Status({required this.permiso, required this.conexion});

  Status copyWith(bool? con, bool? per) {
    return Status(conexion: con ?? conexion, permiso: per ?? permiso);
  }
}
