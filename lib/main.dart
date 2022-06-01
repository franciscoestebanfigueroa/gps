import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps/blocs/Localizacion/localizacion_bloc.dart';
import 'package:gps/blocs/gps/gps_bloc.dart';

import 'package:gps/scr/scr.dart';

void main() => runApp(const MyBloc());

class MyBloc extends StatelessWidget {
  const MyBloc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => GpsBloc()),
      BlocProvider(create: (context) => LocalizacionBloc())
    ], child: const MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocBuilder<GpsBloc, GpsState>(
        builder: (context, state) {
          print(state);
          return //state.allPermisos
              state.permiso || state.isConected
                  ? const Gps()
                  : !state.permiso
                      ? const UserStatus()
                      : !state.isConected
                          ? const AtiveGeo()
                          : const Gps();
        },
      ),
      //initialRoute: 'page_0',
      //routes: {
      //  'page_0': (_) => const UserStatus(),
      //  'page_1': (_) => const Gps()
      //},
    );
  }
}
