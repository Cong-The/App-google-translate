import 'package:app_trans/src/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
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
      ],
      child: const Home(),
    );
  }
}
