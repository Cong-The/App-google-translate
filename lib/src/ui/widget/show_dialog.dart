import 'package:flutter/material.dart';

class ShowDialogLanguage extends StatelessWidget {
  const ShowDialogLanguage({Key? key, required this.list}) : super(key: key);
  final List list;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            return list[index];
          },
        ),
      ),
    );
  }
}
