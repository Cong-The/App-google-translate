import 'package:app_trans/src/app.dart';
import 'package:app_trans/src/bloc/blocs.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TranslateBloc>(
          create: (BuildContext context) => TranslateBloc(),
        ),
        BlocProvider<TextToSpeechBloc>(
          create: (BuildContext context) => TextToSpeechBloc(),
        ),
        BlocProvider<SpeechToTextBloc>(
          create: (BuildContext context) => SpeechToTextBloc(),
        ),
      ],
      child: const MaterialApp(debugShowCheckedModeBanner: false, home: App()),
    );
  }
}
