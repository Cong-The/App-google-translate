import 'package:app_trans/src/bloc/blocs.dart';
import 'package:app_trans/src/constant/iso_language.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:app_trans/src/ui/widget/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ButtonInputLanguage extends StatelessWidget {
  const ButtonInputLanguage(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final List<ListTile> list = ConstLanguage.languageISO.map(
      (e) {
        return ListTile(
          title: Text(ConstLanguage.mapLanguage(languageCode: e)),
          onTap: () {
            context.read<TranslateBloc>().add(GgTransInputLanguage(from: e));
            Navigator.pop(context);
          },
        );
      },
    ).toList();

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: ColorsPrimary.P0, elevation: 0),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDialogLanguage(
                  list: list,
                );
              },
            );
          },
          child: BlocBuilder<TranslateBloc, TranslateState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstLanguage.mapLanguage(
                        languageCode: state.inputLanguage),
                    style: AppTextStyle.textStyle.cBla1().w400().s16(),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: ColorsBlack.Bla1,
                  )
                ],
              );
            },
          )),
    );
  }
}

class ButtonResultLanguage extends StatelessWidget {
  const ButtonResultLanguage(
      {Key? key, required this.height, required this.width})
      : super(key: key);
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final List<ListTile> list = ConstLanguage.languageISO.map(
      (e) {
        return ListTile(
          title: Text(ConstLanguage.mapLanguage(languageCode: e)),
          onTap: () {
            context.read<TranslateBloc>().add(GgTransResultLanguage(to: e));
            context
                .read<TextToSpeechBloc>()
                .add(TextToSpeechLanguage(language: e));
            Navigator.pop(context);
          },
        );
      },
    ).toList();

    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
          style:
              ElevatedButton.styleFrom(primary: ColorsPrimary.P0, elevation: 0),
          onPressed: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return ShowDialogLanguage(
                  list: list,
                );
              },
            );
          },
          child: BlocBuilder<TranslateBloc, TranslateState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ConstLanguage.mapLanguage(
                        languageCode: state.resultLanguage),
                    style: AppTextStyle.textStyle.cBla1().w400().s16(),
                  ),
                  const Icon(
                    Icons.arrow_drop_down,
                    size: 24,
                    color: ColorsBlack.Bla1,
                  )
                ],
              );
            },
          )),
    );
  }
}
