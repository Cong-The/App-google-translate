import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:flutter/material.dart';

class MucUuThich extends StatelessWidget {
  const MucUuThich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            title(),
            const SizedBox(
              height: 48,
            ),
            Text(
              'Value Title language',
              style: AppTextStyle.textStyle.s32().cBla1().w600(),
            ),
            const SizedBox(
              height: 32,
            ),
            saveTranslate(context),
            const SizedBox(
              height: 48,
            ),
            Text(
              'Gần đây',
              style: AppTextStyle.textStyle.s32().cBla1().w600(),
            ),
            const SizedBox(
              height: 32,
            ),
            saveTranslate(context),
          ],
        ),
      ),
    );
  }

  Widget title() {
    return Text(
      'Mục ưa thích',
      style: AppTextStyle.textStyle.s42().cBla1().w700(),
    );
  }

  Widget saveTranslate(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      height: 120,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorsWhite.W0, borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'inputLanguage',
            style: AppTextStyle.textStyle.s14().w500().cBla1(),
          ),
          Text(
            'input',
            style: AppTextStyle.textStyle.s16().w500().cBlu0(),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            'outputLanguage',
            style: AppTextStyle.textStyle.s14().w500().cBla1(),
          ),
          Text(
            'output',
            style: AppTextStyle.textStyle.s16().w500().cBlu0(),
          ),
        ],
      ),
    );
  }
}
