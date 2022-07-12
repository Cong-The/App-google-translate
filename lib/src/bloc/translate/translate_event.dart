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

class GgTransInputText extends TranslateEvent {
  final String input;
  const GgTransInputText({required this.input});
}

class GgTransInputLanguage extends TranslateEvent {
  final String? from;
  const GgTransInputLanguage({required this.from});
}

class GgTransResultLanguage extends TranslateEvent {
  final String? to;
  const GgTransResultLanguage({required this.to});
}

class GgTransSwapLanguge extends TranslateEvent {}

class GgTrans extends TranslateEvent {
  final String input;
  const GgTrans({required this.input});
}
