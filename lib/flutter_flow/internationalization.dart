import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['es', 'en'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? esText = '',
    String? enText = '',
  }) =>
      [esText, enText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // Enter
  {
    'g6tugxtf': {
      'es': 'Eco-sense',
      'en': '',
    },
    '5zqz1qlz': {
      'es': 'Login',
      'en': '',
    },
    'dykzoi9t': {
      'es': '¿Aún no tienes una cuenta?',
      'en': '',
    },
    'k6tdp33q': {
      'es': 'Home',
      'en': '',
    },
  },
  // Home
  {
    'o7opc0af': {
      'es': 'Eco-Sense',
      'en': '',
    },
    'ae6yq0xu': {
      'es': 'Parámetros a tiempo real',
      'en': '',
    },
    '750w3av4': {
      'es': 'Gráfico de parámentros',
      'en': '',
    },
    '19fe5apy': {
      'es': 'Home',
      'en': '',
    },
  },
  // Calendar
  {
    'd1xum63s': {
      'es': 'Eco-Sense',
      'en': '',
    },
    'ghbk8vbq': {
      'es': 'Calendario',
      'en': '',
    },
    'k1m7zmt5': {
      'es': 'Hora',
      'en': '',
    },
    'u5omsif5': {
      'es': 'Datos',
      'en': '',
    },
    'nc5m7g9m': {
      'es': 'Temperatura',
      'en': '',
    },
    'd09xszni': {
      'es': 'Humedad',
      'en': '',
    },
    'obglhrfl': {
      'es': '3:00 p.m.',
      'en': '',
    },
    '6d86wjjr': {
      'es': '30°C',
      'en': '',
    },
    's8nnes3n': {
      'es': '28%',
      'en': '',
    },
    'agst6pvq': {
      'es': 'Home',
      'en': '',
    },
  },
  // Chatbot
  {
    'ewoxo4es': {
      'es': 'Eco Sense',
      'en': '',
    },
    '8lthnwwo': {
      'es': 'Generando respuesta...',
      'en': '',
    },
    '44zuahus': {
      'es': 'Ingrese su pregunta',
      'en': '',
    },
    '4n1v7ojx': {
      'es': 'Home',
      'en': '',
    },
  },
  // Alerts
  {
    'ena4968h': {
      'es': 'Eco-Sense',
      'en': '',
    },
    'g1g8up8x': {
      'es': 'Alertas',
      'en': '',
    },
    'e2hp74er': {
      'es': 'Alerta de temperatura alta',
      'en': '',
    },
    'tb3x5jl6': {
      'es': 'Alerta de temperatura baja',
      'en': '',
    },
    'qvqo34xn': {
      'es': 'Alerta de sequía',
      'en': '',
    },
    'n3akp3v4': {
      'es': 'Alerta de estrés térmicos y sequía',
      'en': '',
    },
    '518j76l2': {
      'es': 'Alerta de inundación',
      'en': '',
    },
    'k3eh1f4z': {
      'es': 'Home',
      'en': '',
    },
  },
  // Settings
  {
    '30dmgda2': {
      'es': 'Account',
      'en': '',
    },
    'bjkhfq8q': {
      'es': 'Privacidad',
      'en': '',
    },
    'yywdzick': {
      'es': 'Idiomas',
      'en': '',
    },
    'f9p1dbw3': {
      'es': 'Ubicación',
      'en': '',
    },
    't6o6w11y': {
      'es': 'Edit Profile',
      'en': '',
    },
    '1v5rgefh': {
      'es': 'General',
      'en': '',
    },
    'aiqbtl8e': {
      'es': 'Terms of Service',
      'en': '',
    },
    '1nbe1jbq': {
      'es': 'Log Out',
      'en': '',
    },
    '6zfimc2q': {
      'es': 'Home',
      'en': '',
    },
  },
  // Login1
  {
    'pvlfw105': {
      'es': 'Eco-Sense',
      'en': '',
    },
    'sjcowqf3': {
      'es': 'Log in',
      'en': '',
    },
    'mdbkw3fg': {
      'es': 'Ingrese email',
      'en': '',
    },
    'uqxnry37': {
      'es': 'Enter Password',
      'en': '',
    },
    'nwgbem1e': {
      'es': 'Iniciar',
      'en': '',
    },
    '20vyupmm': {
      'es': 'Olvidaste tu contraseña',
      'en': '',
    },
  },
  // Created-Acount
  {
    '42oqlnzj': {
      'es': 'Eco-Sense',
      'en': '',
    },
    'wjbseff1': {
      'es': 'Crear cuenta',
      'en': '',
    },
    'owosxhvf': {
      'es': 'Ingrese email',
      'en': '',
    },
    '39axhe70': {
      'es': 'Enter Password',
      'en': '',
    },
    'wn41ffrh': {
      'es': 'Acepto los términos y condiciones',
      'en': '',
    },
    'dh9c6dnw': {
      'es': 'Registrarse',
      'en': '',
    },
  },
  // Miscellaneous
  {
    'n3pb6qqt': {
      'es': '',
      'en': '',
    },
    '33nczknk': {
      'es': '',
      'en': '',
    },
    'ti1cljsu': {
      'es': '',
      'en': '',
    },
    'ivchzfyf': {
      'es': '',
      'en': '',
    },
    'nrbve26i': {
      'es': '',
      'en': '',
    },
    'yzg1kpem': {
      'es': '',
      'en': '',
    },
    '42ya95qe': {
      'es': '',
      'en': '',
    },
    'mthmaxqh': {
      'es': '',
      'en': '',
    },
    'q4sho2d9': {
      'es': '',
      'en': '',
    },
    'th1nzd8x': {
      'es': '',
      'en': '',
    },
    'l4jbvctw': {
      'es': '',
      'en': '',
    },
    'pjoxef3z': {
      'es': '',
      'en': '',
    },
    '1nnv9tlu': {
      'es': '',
      'en': '',
    },
    'x5chygk1': {
      'es': '',
      'en': '',
    },
    '0dbr7q5o': {
      'es': '',
      'en': '',
    },
    'fo3csn5t': {
      'es': '',
      'en': '',
    },
    'ikmoqo44': {
      'es': '',
      'en': '',
    },
    'tzfa4a0o': {
      'es': '',
      'en': '',
    },
    'th0o64op': {
      'es': '',
      'en': '',
    },
    '1n6omrkq': {
      'es': '',
      'en': '',
    },
    'n16saypp': {
      'es': '',
      'en': '',
    },
    '9rfy6mhr': {
      'es': '',
      'en': '',
    },
    '5nt14zmr': {
      'es': '',
      'en': '',
    },
    '24n5lgqv': {
      'es': '',
      'en': '',
    },
    'kmvyku7i': {
      'es': '',
      'en': '',
    },
  },
].reduce((a, b) => a..addAll(b));
