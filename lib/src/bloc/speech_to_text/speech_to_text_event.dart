part of 'speech_to_text_bloc.dart';

abstract class SpeechToTextEvent extends Equatable {
  const SpeechToTextEvent();
  @override
  List<Object> get props => [];
}

class SpeechToTextInitData extends SpeechToTextEvent {}

class SpeechToTextStartRecognizing extends SpeechToTextEvent {}

class SpeechToTextWordByWord extends SpeechToTextEvent {
  final String currentText;
  const SpeechToTextWordByWord({
    required this.currentText,
  });
}

class SpeechToTextDoneRecognizing extends SpeechToTextEvent {}

class SpeechToTextStopRecognizing extends SpeechToTextEvent {}

class SpeechToTextCancelRecognizing extends SpeechToTextEvent {}
