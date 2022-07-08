import 'package:app_trans/src/app.dart';
import 'package:app_trans/src/bloc/translate/blocover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  // Bloc.observer = SimPBlocObserver();
  BlocOverrides.runZoned(() => runApp(const MyApp()),
      blocObserver: SimPBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: App());
  }
}
