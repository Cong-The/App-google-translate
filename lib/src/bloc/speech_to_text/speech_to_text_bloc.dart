import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:speech_to_text/speech_to_text.dart';

part 'speech_to_text_event.dart';
part 'speech_to_text_state.dart';

class SpeechToTextBloc extends Bloc<SpeechToTextEvent, SpeechToTextState> {
  final SpeechToText speechToText = SpeechToText();
  SpeechToTextBloc() : super(const SpeechToTextInitial()) {
    on<SpeechToTextInitData>(_onSpeechToTextInitData);
    on<SpeechToTextDoneRecognizing>(_onSpeechToTextDoneRecognizing);
    on<SpeechToTextStartRecognizing>(_onSpeechToTextStartRecordnizing);
    on<SpeechToTextWordByWord>(_onSpeechToTextWordByWord);
    on<SpeechToTextStopRecognizing>(_onSpeechToTextStopRecordnizing);
    on<SpeechToTextCancelRecognizing>(_onSpeechToTextCancelRecordnizing);
  }
  Future<void> _onSpeechToTextInitData(
      SpeechToTextInitData event, Emitter<SpeechToTextState> emitter) async {
    bool available = await speechToText.initialize(
        onStatus: (status) {
          if (status == 'done') {
            add(SpeechToTextDoneRecognizing());
          }
        },
        debugLogging: true);
    if (available) {
      emitter(state.cloneWith(
        listenDuration: 30,
        pauseDuration: 3,
        status: SpeechToTextStatus.ready,
        recognizedWords: "Enter Voice",
        // currentLocaleId: systmLocale?.localeId,
      ));
    }
  }

  void _onSpeechToTextStartRecordnizing(
      SpeechToTextStartRecognizing event, Emitter emitter) async {
    emitter(state.cloneWith(
        status: SpeechToTextStatus.recognizing,
        recognizedWords: "Enter Voice"));

    try {
      emitter(state.cloneWith(
        status: SpeechToTextStatus.recognizing,
      ));
      speechToText.listen(
          cancelOnError: true,
          listenFor: Duration(seconds: state.listenDuration),
          pauseFor: Duration(seconds: state.pauseDuration),
          onResult: (result) {
            add(SpeechToTextWordByWord(currentText: result.recognizedWords));
          });
    } catch (_) {
      add(SpeechToTextCancelRecognizing());
    }
  }

  void _onSpeechToTextDoneRecognizing(
      SpeechToTextDoneRecognizing event, Emitter emitter) {
    emitter(state.cloneWith(status: SpeechToTextStatus.ready));
  }

  void _onSpeechToTextWordByWord(
      SpeechToTextWordByWord event, Emitter<SpeechToTextState> emitter) {
    emitter(state.cloneWith(
        status: SpeechToTextStatus.recognizing,
        recognizedWords: event.currentText));
  }

  void _onSpeechToTextStopRecordnizing(SpeechToTextStopRecognizing event,
      Emitter<SpeechToTextState> emitter) async {
    await speechToText.stop();
    emitter(state.cloneWith(status: SpeechToTextStatus.ready));
  }

  void _onSpeechToTextCancelRecordnizing(
      SpeechToTextCancelRecognizing event, Emitter<SpeechToTextState> emitter) {
    emitter(state.cloneWith(
        status: SpeechToTextStatus.ready, recognizedWords: "Enter Voice"));
  }
}
