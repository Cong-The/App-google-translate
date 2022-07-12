import 'package:app_trans/src/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonTextToSpeech extends StatelessWidget {
  const ButtonTextToSpeech({Key? key, required this.result}) : super(key: key);
  final String result;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              context
                  .read<TextToSpeechBloc>()
                  .add(TextToSpeechPlay(text: result));
            },
            icon: const Icon(
              Icons.play_arrow,
              // color: ColorsBlue.Blu0,
              size: 32,
            ));
      },
    );
  }
}
