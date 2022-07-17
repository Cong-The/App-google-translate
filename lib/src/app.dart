import 'package:app_trans/src/bloc/speech_to_text/speech_to_text_bloc.dart';
import 'package:app_trans/src/bloc/translate/translate_bloc.dart';
import 'package:app_trans/src/ui/design/app_colors.dart';
import 'package:app_trans/src/ui/screen/chat.dart';
import 'package:app_trans/src/ui/screen/choose_language.dart';
import 'package:app_trans/src/ui/screen/muc_ua_thich.dart';
import 'package:app_trans/src/ui/screen/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:avatar_glow/avatar_glow.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOption = <Widget>[
    Home(),
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
    context.read<SpeechToTextBloc>().add(SpeechToTextInitData());
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // resizeToAvoidBottomInset: false,
        appBar: _appBar(),
        bottomNavigationBar: _bottomNavigationBar(),
        body: SafeArea(child: _widgetOption.elementAt(_selectedIndex)),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: BlocBuilder<SpeechToTextBloc, SpeechToTextState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context
                    .read<SpeechToTextBloc>()
                    .add(SpeechToTextStartRecognizing());
                context
                    .read<TranslateBloc>()
                    .add(GgTransInputText(input: state.recognizedWords));
              },
              child: Stack(
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
            );
          },
        )

        // AvatarGlow(
        //   animate: _isListening,
        //   glowColor: Theme.of(context).primaryColor,
        //   endRadius: 75.0,
        //   duration: const Duration(milliseconds: 2000),
        //   repeatPauseDuration: const Duration(milliseconds: 100),
        //   repeat: true,
        //   child: FloatingActionButton(
        //     onPressed: _listen,
        //     child: Icon(_isListening ? Icons.mic : Icons.mic_none),
        //   ),
        // ),
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

  AppBar _appBar() {
    return AppBar(
        elevation: 0,
        backgroundColor: ColorsPrimary.P0,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.dark,
            statusBarColor: ColorsPrimary.P0),
        title: _selectedIndex == 0 ? const ChooseLanguage() : Container());
  }
}
