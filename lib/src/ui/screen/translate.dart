import 'package:app_trans/src/bloc/blocs.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:app_trans/src/ui/screen/screen2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppTranslate extends StatefulWidget {
  const AppTranslate({Key? key}) : super(key: key);

  @override
  State<AppTranslate> createState() => _AppTranslateState();
}

bool click = false;

class _AppTranslateState extends State<AppTranslate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: click ? const Screen2() : _body(),
    );
  }

  Widget _body() {
    return InkWell(
      onTap: () {
        setState(() {
          click = true;
        });
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorsWhite.W0,
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                'Nhập văn bản',
                style: AppTextStyle.textStyle.s24().w500().cG0(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
