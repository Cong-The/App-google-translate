part of 'translate_bloc.dart';

class TranslateState extends Equatable {
  final String inputText;
  final String inputLanguage;
  final String resultText;
  final String resultLanguage;
  const TranslateState(
      {this.inputText = '',
      this.inputLanguage = '',
      this.resultText = '',
      this.resultLanguage = ''});
  @override
  // TODO: implement props
  List<Object?> get props =>
      [inputText, inputLanguage, resultText, resultLanguage];
  // List<Object?> get props => [];

  TranslateState cloneWith({
    String? inputText,
    String? inputLanguage,
    String? resultText,
    String? resultLanguage,
  }) {
    return TranslateState(
        inputLanguage: inputLanguage ?? '',
        inputText: inputText ?? '',
        resultLanguage: resultLanguage ?? '',
        resultText: resultText ?? '');
  }
}

class TranslateInitial extends TranslateState {
  const TranslateInitial();
}
