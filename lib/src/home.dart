import 'package:app_trans/src/bloc/text_to_speech/text_to_speech_bloc.dart';
import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/constant/iso_flag.dart';
import 'package:app_trans/src/constant/iso_language.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/design/app_text_style.dart';
import 'package:app_trans/src/ui/screen/chat.dart';
import 'package:app_trans/src/ui/screen/muc_ua_thich.dart';
import 'package:app_trans/src/ui/screen/translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flag/flag.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  List<String> map = [];

  static const List<Widget> _widgetOption = <Widget>[
    AppTranslate(),
    Chat(),
    MucUuThich(),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setMap();
    blocInitData();
  }

  void setMap() {
    ConstLanguage.mapLanguage.values.forEach(
      (element) {
        map.add(element);
      },
    );
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
      appBar: _appBar(map),
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

  AppBar _appBar(List map) {
    return AppBar(
        toolbarHeight: 80,
        elevation: 0,
        backgroundColor: ColorsPrimary.P0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorsPrimary.P0),
        title: _selectedIndex == 0 ? _title(map) : Container());
  }

  Widget _title(List map) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => _inputLanguage(map),
              );
            },
            child: const Text('input')),
        ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => _resultLanguage(map),
              );
            },
            child: const Text('output')),
      ],
    );
  }

  Widget _resultLanguage(List map) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TranslateBloc(),
        ),
        BlocProvider(
          create: (context) => TextToSpeechBloc(),
        )
      ],
      child: BlocBuilder<TranslateBloc, TranslateState>(
        builder: (context, state) {
          return AlertDialog(
              title: const Text('Languageout'),
              content: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BlocBuilder<TextToSpeechBloc, TextToSpeechState>(
                    builder: ((context, state) {
                      return ListView.builder(
                          itemCount: ConstFlag.flag.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                // print(ConstLanguage.languageISO[index]);
                                // context.read<TranslateBloc>().add(GgTransChangeLanguage(
                                //     from: ConstLanguage.languageISO[index]));
                                context.read<TranslateBloc>().add(
                                    GgTransResultLanguage(
                                        to: ConstLanguage.languageISO[index]));
                                // BlocProvider.of<TranslateBloc>(context).add(
                                //     GgTransChangeLanguage(
                                //         from: ConstLanguage.languageISO[index]));
                                context.read<TextToSpeechBloc>().add(
                                    TextToSpeechLanguage(
                                        language:
                                            ConstLanguage.languageISO[index]));
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                child: Row(
                                  children: [
                                    Flag.fromString(
                                      ConstFlag.flag[index],
                                      height: 24,
                                      width: 24,
                                    ),
                                    Text(
                                      map[index],
                                      style: AppTextStyle.textStyle
                                          .s24()
                                          .w500()
                                          .cBla1(),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          });
                    }),
                  )));
        },
      ),
    );
  }

  Widget _inputLanguage(List map) {
    return BlocProvider(
      create: (context) => TranslateBloc(),
      child: BlocBuilder<TranslateBloc, TranslateState>(
        builder: (context, state) {
          return AlertDialog(
              title: const Text('LanguageInput'),
              content: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: ConstFlag.flag.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        // print(ConstLanguage.languageISO[index]);
                        // context.read<TranslateBloc>().add(GgTransChangeLanguage(
                        //     from: ConstLanguage.languageISO[index]));
                        context.read<TranslateBloc>().add(GgTransChangeLanguage(
                            from: ConstLanguage.languageISO[index]));
                        // BlocProvider.of<TranslateBloc>(context).add(
                        //     GgTransChangeLanguage(
                        //         from: ConstLanguage.languageISO[index]));
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          children: [
                            Flag.fromString(
                              ConstFlag.flag[index],
                              height: 24,
                              width: 24,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              map[index],
                              style:
                                  AppTextStyle.textStyle.s24().w500().cBla1(),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ));
        },
      ),
    );
  }
}
