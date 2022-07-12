import 'package:app_trans/src/bloc/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonClearInput extends StatelessWidget {
  const ButtonClearInput({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          context.read<TranslateBloc>().add(const GgTransInputText(input: ''));
        },
        icon: const Icon(
          Icons.delete,
          size: 32,
        ));
  }
}
