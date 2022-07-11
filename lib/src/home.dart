import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/screen/chat.dart';
import 'package:app_trans/src/ui/screen/muc_ua_thich.dart';
import 'package:app_trans/src/ui/screen/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    AppTranslate(),
    Chat(),
    MucUuThich(),
  ];

  @override
  void initState() {
    super.initState();
    blocInitData();
  }

  void blocInitData() {
    context.read<TranslateBloc>().add(const GgTranslateInit(
        inputText: '', resultText: '', from: 'en', to: 'vi'));
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: _appBar(),
      bottomNavigationBar: _bottomNavigationBar(),
      body: SafeArea(child: _widgetOption.elementAt(_selectedIndex)),
    );
  }

  Widget _bottomNavigationBar() {
    return BottomNavigationBar(
      elevation: 0,
      backgroundColor: _selectedIndex == 2 ? ColorsPrimary.P0 : ColorsWhite.W0,
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(
            Icons.translate,
          ),
          label: 'Bản dịch',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.chat,
          ),
          label: 'Cuộc hội thoại',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.star,
          ),
          label: 'Mục ưu thích',
        ),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: ColorsBlue.Blu0,
      onTap: _onItemTapped,
    );
  }

  // AppBar _appBar() {
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: ColorsPrimary.P0,
  //     systemOverlayStyle: const SystemUiOverlayStyle(
  //         statusBarIconBrightness: Brightness.dark,
  //         statusBarColor: ColorsPrimary.P0),
  //     // title: _selectedIndex == 0 ? _title(map) : Container()
  //   );
  // }
}
