import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:translator/translator.dart';
import 'package:rxdart/rxdart.dart';

part 'translate_event.dart';
part 'translate_state.dart';

class TranslateBloc extends Bloc<TranslateEvent, TranslateState> {
  // EventTransformer<Event> debounceSequential<Event>(Duration duration) {
  //   return (events, mapper) =>
  //       events.debounceTime(duration).asyncExpand(mapper);
  // }

  final GoogleTranslator googleTranslator = GoogleTranslator();

  TranslateBloc() : super(const TranslateInitial()) {
    on<GgTranslateInit>(_onGgTranslateInit);
    on<GgTransInput>(
      _onGgTransInput,
      // transformer: debounceSequential(const Duration(microseconds: 300))
    );
    on<GgTransChangeLanguage>(_onGgTransChangeLanguage);
    on<GgTransResultLanguage>(_onGgTransResultLanguage);
    // on<GgTransResultText>(_onGgTransResultText);
    on<GgTrans>(
      _onGgTrans,
      // transformer: debounceSequential(const Duration(microseconds: 300)),
    );
  }

  Future<void> _onGgTranslateInit(
      GgTranslateInit event, Emitter<TranslateState> emitter) async {
    emitter(state.cloneWith(
        inputText: event.inputText,
        inputLanguage: event.from,
        resultText: event.resultText,
        resultLanguage: event.to));
  }

  void _onGgTransInput(GgTransInput event, Emitter<TranslateState> emitter) {
    emitter(state.cloneWith(inputText: event.input));
    add(GgTrans(input: event.input));
  }

  void _onGgTransChangeLanguage(
      GgTransChangeLanguage event, Emitter<TranslateState> emitter) {
    emitter(state.cloneWith(inputLanguage: event.from));
  }

  void _onGgTransResultLanguage(
      GgTransResultLanguage event, Emitter<TranslateState> emitter) {
    emitter(state.cloneWith(resultLanguage: event.to));
  }

  // void _onGgTransResultText(
  //     GgTransResultText event, Emitter<TranslateState> emitter) {
  //   emitter(state.cloneWith(
  //       inputText: state.inputText,
  //       inputLanguage: state.inputLanguage,
  //       resultText: state.resultText,
  //       resultLanguage: state.resultLanguage));
  // }

  Future<void> _onGgTrans(
      GgTrans event, Emitter<TranslateState> emitter) async {
    print(state.inputLanguage);
    print(state.resultLanguage);
    if (event.input.trim() != "" && event.input.isNotEmpty) {
      final Translation resultText =
          await googleTranslator.translate(event.input,
              from: state.inputLanguage,
              // from: 'en',
              to: state.resultLanguage
              // to: 'vi'
              );

      emitter(state.cloneWith(resultText: resultText.text));
    }
  }
}
