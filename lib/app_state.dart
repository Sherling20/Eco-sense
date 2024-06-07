import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _AnswerEstatus = prefs.getString('ff_AnswerEstatus') ?? _AnswerEstatus;
    });
    _safeInit(() {
      _Question = prefs.getString('ff_Question') ?? _Question;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _AnswerEstatus = '';
  String get AnswerEstatus => _AnswerEstatus;
  set AnswerEstatus(String value) {
    _AnswerEstatus = value;
    prefs.setString('ff_AnswerEstatus', value);
  }

  String _Question = '';
  String get Question => _Question;
  set Question(String value) {
    _Question = value;
    prefs.setString('ff_Question', value);
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
