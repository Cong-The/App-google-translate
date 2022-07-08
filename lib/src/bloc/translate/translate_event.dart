part of 'translate_bloc.dart';

abstract class TranslateEvent extends Equatable {
  const TranslateEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GgTranslateInit extends TranslateEvent {
  final String inputText;
  final String resultText;
  final String from;
  final String to;
  const GgTranslateInit(
      {required this.inputText,
      required this.resultText,
      required this.from,
      required this.to});
  @override
  List<Object?> get props => [inputText, resultText, from, to];
}

class GgTransInput extends TranslateEvent {
  final String input;
  const GgTransInput({required this.input});
  @override
  List get props => [input];
}

class GgTransChangeLanguage extends TranslateEvent {
  final String? from;
  const GgTransChangeLanguage({required this.from});
}

class GgTransResultLanguage extends TranslateEvent {
  final String? to;
  const GgTransResultLanguage({required this.to});
}

class GgTransResultText extends TranslateEvent {}

class GgTrans extends TranslateEvent {
  final String input;
  const GgTrans({required this.input});
  @override
  List get props => [input];
}
