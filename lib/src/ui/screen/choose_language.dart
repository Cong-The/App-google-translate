import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/ui/widget/button_choose_language.dart';
import 'package:app_trans/src/ui/widget/button_swap_language.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            ButtonInputLanguage(height: 32, width: 150),
            ButtonSwapLanguage(),
            ButtonResultLanguage(height: 32, width: 150)
          ],
        );
      },
    );
  }
}
