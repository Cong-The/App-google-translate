import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonSwapLanguage extends StatelessWidget {
  const ButtonSwapLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<TranslateBloc>().add(GgTransSwapLanguge());
        },
        icon: const Icon(
          Icons.swap_horiz,
          color: ColorsBlack.Bla1,
        ));
  }
}
