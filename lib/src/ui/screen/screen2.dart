import 'package:app_trans/src/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/constant/iso_language.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:translator/translator.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  String result = '';
  TextEditingController controller = TextEditingController();
  final translator = GoogleTranslator();
  List<String> map = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMap();
  }

  void setMap() {
    ConstLanguage.mapLanguage.values.forEach(
      (element) {
        map.add(element);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TranslateBloc, TranslateState>(
        builder: (context, state) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _chooseLanguage(),
          Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              color: ColorsWhite.W0,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
            ),
            height: 350,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // inputLanguage,
                        ConstLanguage.mapLanguage[state.inputLanguage] ?? '',
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
                        ConstLanguage.mapLanguage[state.resultLanguage] ?? '',
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
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.star_border_outlined)),
                    _playTextToSpeech()
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Expanded(
              child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              // color: ColorsWhite.W0,
              color: ColorsBlue.Blu0,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: TextField(
              // maxLines: 2,
              autofocus: true,
              controller: controller,
              onChanged: (value) {
                context
                    .read<TranslateBloc>()
                    .add(GgTransInput(input: controller.text));

                setState(() {
                  result = state.resultText;
                });
              },
              decoration: InputDecoration.collapsed(
                hintText: 'Enter text',
                hintStyle: AppTextStyle.textStyle.s24().w500().cG0(),
              ),
            ),
          ))
        ],
      );
    });
  }

  Widget _playTextToSpeech() {
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
              color: ColorsBlue.Blu0,
              size: 24,
            ));
      },
    );
  }

  Widget _chooseLanguage() {
    return BlocBuilder<TranslateBloc, TranslateState>(
      builder: (context, state) {
        return Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return BlocBuilder<TranslateBloc, TranslateState>(
                          builder: (context, state) {
                            return SizedBox(
                              height: MediaQuery.of(context).size.height / 2,
                              child: ListView.builder(
                                  itemCount: map.length,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        context.read<TranslateBloc>().add(
                                            GgTransChangeLanguage(
                                                from: ConstLanguage
                                                    .languageISO[index]));
                                        Navigator.pop(context);
                                      },
                                      child: Center(
                                        child: Container(
                                            padding: const EdgeInsets.all(8),
                                            child: Text(
                                              map[index],
                                              style: AppTextStyle.textStyle
                                                  .cBla1()
                                                  .w500()
                                                  .s24(),
                                            )),
                                      ),
                                    );
                                  }),
                            );
                          },
                        );
                      });
                },
                child:
                    Text(ConstLanguage.mapLanguage[state.inputLanguage] ?? '')),
            ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        content: SizedBox(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            child: BlocBuilder<TextToSpeechBloc,
                                TextToSpeechState>(
                              builder: (context, state) {
                                return ListView.builder(
                                    itemCount: map.length,
                                    itemBuilder: (context, index) {
                                      return Container(
                                          padding: const EdgeInsets.all(8),
                                          child: InkWell(
                                            onTap: () {
                                              context.read<TranslateBloc>().add(
                                                  GgTransResultLanguage(
                                                      to: ConstLanguage
                                                          .languageISO[index]));
                                              context
                                                  .read<TextToSpeechBloc>()
                                                  .add(TextToSpeechLanguage(
                                                      language: ConstLanguage
                                                          .languageISO[index]));
                                              Navigator.pop(context);
                                            },
                                            child: Text(
                                              map[index],
                                              style: AppTextStyle.textStyle
                                                  .cBla1()
                                                  .w500()
                                                  .s24(),
                                            ),
                                          ));
                                    });
                              },
                            )),
                      );
                    },
                  );
                },
                child: Text(
                    ConstLanguage.mapLanguage[state.resultLanguage] ?? '')),
          ],
        );
      },
    );
  }
}
