import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/constant/iso_language.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:app_trans/src/ui/widget/button_clear_input.dart';
import 'package:app_trans/src/ui/widget/button_text_to_speech.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

class Translate extends StatefulWidget {
  const Translate({Key? key}) : super(key: key);

  @override
  State<Translate> createState() => _TranslateState();
}

class _TranslateState extends State<Translate> {
  TextEditingController controller = TextEditingController();
  final translator = GoogleTranslator();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
        builder: (context, state) {
      return SingleChildScrollView(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: ColorsWhite.W0,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                ),
                height: 450,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SingleChildScrollView(child: _resultTranslate()),
                    ),
                    _tool(),
                  ],
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              _inputText(),
            ],
          ),
        ),
      );
    });
  }

  Widget _inputText() {
    return Container(
      height: 200,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: ColorsWhite.W0,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: Column(
        children: [
          TextField(
            autofocus: true,
            controller: controller,
            onChanged: (value) {
              context
                  .read<TranslateBloc>()
                  .add(GgTransInputText(input: controller.text));
            },
            decoration: InputDecoration.collapsed(
              hintText: 'Enter text',
              hintStyle: AppTextStyle.textStyle.s24().w500().cG0(),
            ),
          ),
          Stack(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: const BoxDecoration(
                    color: ColorsBlue.Blu0, shape: BoxShape.circle),
                child: const Center(
                  child: Icon(
                    Icons.mic,
                    size: 48,
                    color: ColorsWhite.W0,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _resultTranslate() {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              // inputLanguage,
              ConstLanguage.mapLanguage(languageCode: state.inputLanguage),
              style: AppTextStyle.textStyle.s14().w500().cBla1(),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              // input,
              state.inputText,
              style: AppTextStyle.textStyle.s20().w600().cBla1(),
            ),
            const Divider(
              height: 32,
              color: ColorsPrimary.P0,
              thickness: 3,
            ),
            Text(
              // outputLanguage,
              ConstLanguage.mapLanguage(languageCode: state.resultLanguage),
              style: AppTextStyle.textStyle.s14().w500().cBlu0(),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              // output,
              state.resultText,
              style: AppTextStyle.textStyle.s20().w600().cBlu0(),
            ),
          ],
        );
      },
    );
  }

  Widget _tool() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        //button save
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.star_border_outlined,
              size: 32,
            )),
        // button play TextToSpeech
        ButtonTextToSpeech(
            result: context.read<TranslateBloc>().state.resultText),
        // button clear
        const ButtonClearInput(),
        // button copy
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.copy,
              size: 32,
            )),
      ],
    );
  }
}
