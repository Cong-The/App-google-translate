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
    on<TextToSpeechStop>(_onTTSStop);
    on<TextToSpeechLanguage>(_onTTSChangLanguage);
  }

  Future<void> _onTTSInitData(
      TextToSpeechInitData event, Emitter<TextToSpeechState> emitter) async {
    // final langusge = await flutterTts.getLanguages as List;
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
    // await flutterTts.setLanguage('vi');
    await flutterTts.setLanguage(state.language);
    if (event.text.trim() != "") {
      await flutterTts.speak(event.text);
      emitter(state.cloneWith(status: TextToSpeechStatus.playing));
    }
    flutterTts.setCompletionHandler(() {
      // add(TextToSpeechStop());
    });
  }

  Future<void> _onTTSStop(
      TextToSpeechStop event, Emitter<TextToSpeechState> emitter) async {
    await flutterTts.stop();
    emitter(state.cloneWith(status: TextToSpeechStatus.stoped));
  }

  void _onTTSChangLanguage(
      TextToSpeechLanguage event, Emitter<TextToSpeechState> emitter) {
    emitter(state.cloneWith(language: event.language));
  }
}
