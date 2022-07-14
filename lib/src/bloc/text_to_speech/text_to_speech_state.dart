part of 'text_to_speech_bloc.dart';

enum TextToSpeechStatus { playing, stoped, paused, continued }

class TextToSpeechState extends Equatable {
  final String language;

  final TextToSpeechStatus status;
  final double volume;
  final double pitch;
  final double rate;
  const TextToSpeechState(
      {this.language = '',
      this.status = TextToSpeechStatus.stoped,
      this.volume = 0.5,
      this.pitch = 1,
      this.rate = 0.5});

  @override
  List<Object> get props => [volume, language, pitch, rate];

  TextToSpeechState cloneWith({
    List<Object?>? languages,
    String? language,
    TextToSpeechStatus? status,
    double? volume,
    double? pitch,
    double? rate,
  }) {
    return TextToSpeechState(
        language: language ?? this.language,
        status: status ?? this.status,
        volume: volume ?? this.volume,
        pitch: pitch ?? this.pitch,
        rate: rate ?? this.rate);
  }
}

class TextToSpeechInitial extends TextToSpeechState {
  const TextToSpeechInitial();
}
