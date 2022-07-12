import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:app_trans/src/ui/screen/translate.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

bool click = false;

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: click ? const Translate() : _body(),
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
