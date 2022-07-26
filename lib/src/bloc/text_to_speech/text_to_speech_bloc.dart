import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_tts/flutter_tts.dart';
part 'text_to_speech_event.dart';
part 'text_to_speech_state.dart';

class TextToSpeechBloc extends Bloc<TextToSpeechEvent, TextToSpeechState> {
  final FlutterTts flutterTts = FlutterTts();
  TextToSpeechBloc() : super(const TextToSpeechInitial()) {
    on<TextToSpeechInitData>(_onTTSInitData);
    on<TextToSpeechPlay>(_onTTSPlay);
    on<TextToSpeechPause>(_onTTSPause);
    on<TextToSpeechLanguage>(_onTTSChangLanguage);
  }

  Future<void> _onTTSInitData(
      TextToSpeechInitData event, Emitter<TextToSpeechState> emitter) async {
    emitter(state.cloneWith(
      volume: 0.5,
      pitch: 1,
      rate: 0.5,
      language: '',
    ));
  }

  Future<void> _onTTSPlay(
      TextToSpeechPlay event, Emitter<TextToSpeechState> emitter) async {
    // await flutterTts.pause();
    // await flutterTts.continueHandler;
    await flutterTts.setVolume(state.volume);
    await flutterTts.setPitch(state.pitch);
    await flutterTts.setSpeechRate(state.rate);
    await flutterTts.setLanguage(state.language);
    if (event.text.trim() != "") {
      await flutterTts.speak(event.text);
      emitter(state.cloneWith(status: TextToSpeechStatus.playing));
    }
    flutterTts.setCompletionHandler(() {
      // add(TextToSpeechPause());
    });
  }

  Future<void> _onTTSPause(
      TextToSpeechPause event, Emitter<TextToSpeechState> emitter) async {
    await flutterTts.pause();
    emitter(state.cloneWith(status: TextToSpeechStatus.paused));
  }

  void _onTTSChangLanguage(
      TextToSpeechLanguage event, Emitter<TextToSpeechState> emitter) {
    emitter(state.cloneWith(language: event.language));
  }
}
