import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gps/blocs/gps/gps_bloc.dart';

class UserStatus extends StatelessWidget {
  const UserStatus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Bienvenido a GPS ',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(
              height: 40,
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                onPressed: () {
                  BlocProvider.of<GpsBloc>(context)
                      .add(const EventPermiso(true));
                },
                child: const Text(
                  'Permitir',
                  style: TextStyle(fontSize: 40),
                ))
          ],
        ),
      ),
    );
  }
}
