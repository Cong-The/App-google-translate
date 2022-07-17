part of 'speech_to_text_bloc.dart';

enum SpeechToTextStatus { recognizing, ready, unknown }

class SpeechToTextState extends Equatable {
  const SpeechToTextState({
    this.listenDuration = 60,
    this.pauseDuration = 5,
    this.recognizedWords = "",
    // this.currentLocaleId = "",
    this.status = SpeechToTextStatus.unknown,
  });
  final int listenDuration;
  final int pauseDuration;
  final String recognizedWords;
  // final String currentLocaleId;
  final SpeechToTextStatus status;

  @override
  List<Object> get props => [
        listenDuration, pauseDuration, recognizedWords,
        // currentLocaleId,
        status
      ];
  SpeechToTextState cloneWith({
    int? listenDuration,
    int? pauseDuration,
    String? recognizedWords,
    // String? currentLocaleId,
    SpeechToTextStatus? status,
  }) {
    return SpeechToTextState(
      listenDuration: listenDuration ?? this.listenDuration,
      pauseDuration: pauseDuration ?? this.pauseDuration,
      recognizedWords: recognizedWords ?? this.recognizedWords,
      // currentLocaleId: currentLocaleId ?? this.currentLocaleId,
      status: status ?? this.status,
    );
  }
}

class SpeechToTextInitial extends SpeechToTextState {
  const SpeechToTextInitial();
}
