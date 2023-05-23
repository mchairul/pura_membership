import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pura_membership/screens/screen_home.dart';
import 'package:pura_membership/screens/screen_my_account.dart';
import 'package:pura_membership/screens/screen_prizes.dart';
import 'package:pura_membership/screens/screen_redeem.dart';
import 'package:pura_membership/screens/screen_info.dart';
import 'package:pura_membership/models/prize_redeem_model.dart';

class AppProvider extends ChangeNotifier {
  final String inputUser;
  AppProvider({required String this.inputUser});

  late Widget _currentScreen = const ScreenHome();
  List<Redeem> redeem = [];

  Widget get currentScreen => _currentScreen;

  set currentScreen(Widget newScreen) {
    _currentScreen = newScreen;
    notifyListeners();
  }

  late int _saldo = 100000;

  void setSaldo(int saldo) {
    _saldo = saldo;
  }

  int get getSaldo => _saldo;

  late String _user = inputUser;

  void setUser(String user) {
    _user = user;
  }

  String get getUser => _user;

  void changeCurrentScreen(CustomScreensEnum screen) {
    switch(screen) {
      case CustomScreensEnum.homeScreen:
        currentScreen = const ScreenHome();
        break;
      case CustomScreensEnum.profileScreen:
        currentScreen = const ScreenMyAccount();
        break;
      case CustomScreensEnum.prizesScreen:
        currentScreen = const ScreenPrizes();
        break;
      case CustomScreensEnum.redeemScreen:
        currentScreen = const ScreenRedeem();
        break;
      case CustomScreensEnum.infoScreen:
        currentScreen = const ScreenInfo();
        break;
      default:
        currentScreen = const ScreenHome();
        break;
    }
  }

  Map<String, dynamic> _map = {};
  Future<void> get prizesData async {
    await Future.delayed(const Duration(seconds: 3));
    final String response = await rootBundle.loadString("assets/prizes.json");
    _map = await json.decode(response);
    notifyListeners();
  }
  Map<String, dynamic> get map => _map;

  void addRedeem (String name, int cost) {
    DateTime now = DateTime.now();
    String strNow = DateFormat('yyyy-MM-dd kk:mm').format(now);
    redeem.add(Redeem(prizes: name, cost:cost, date: strNow));
  }
  get getRedeem => redeem;
}

enum CustomScreensEnum {
  homeScreen,
  profileScreen,
  prizesScreen,
  redeemScreen,
  infoScreen
}
