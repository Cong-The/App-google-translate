part of 'text_to_speech_bloc.dart';

abstract class TextToSpeechEvent extends Equatable {
  const TextToSpeechEvent();

  @override
  List<Object> get props => [];
}

class TextToSpeechLanguages extends TextToSpeechEvent {
  final String? textToSpeech;
  const TextToSpeechLanguages({required this.textToSpeech});
}

class TextToSpeechInitData extends TextToSpeechEvent {}

class TextToSpeechLanguage extends TextToSpeechEvent {
  final String language;
  const TextToSpeechLanguage({required this.language});
  @override
  List<Object> get props => [language];
}

class TextToSpeechPlay extends TextToSpeechEvent {
  final String text;
  const TextToSpeechPlay({
    required this.text,
  });
}

class TextToSpeechStop extends TextToSpeechEvent {}
