import 'package:agrisense/models/featuresResultModel.dart';
import 'package:agrisense/screens/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(AgriSenseApp());
}

class AgriSenseApp extends StatelessWidget {
  const AgriSenseApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF5865F2),
        scaffoldBackgroundColor: Color(0xFF23272A),
        colorScheme: ColorScheme.dark(
          primary: Color(0xFF5865F2),
          secondary: Color(0xFF5865F2),
        ),
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.grey[300]),
          headline6: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF2C2F33),
          foregroundColor: Colors.white,
        ),
        buttonTheme: ButtonThemeData(
          buttonColor: Color(0xFF5865F2),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      home: SignInPage1(),
    );
  }
}

class PredictedResult {
  static final PredictedResult _instance = PredictedResult._internal();

  factory PredictedResult() {
    return _instance;
  }

  PredictedResult._internal();

  double nitrogen = 0;
  double potassium = 0;
  double phosphorus = 0;
  double rainfall = 0;
  double temperature = 0;
  double humidity = 0;
  double pH = 0;
  String location = '';
  String dateTime = '';
  String recommendedCrop = '';
  double certaintyLevel = 0;
  String season = '';
}

class UserData {
  static final UserData _instance = UserData._internal();

  factory UserData() {
    return _instance;
  }

  UserData._internal();

  int userID = 0;
  String username = '';
  String password = '';

  String email = '';
  int number = 0;
  String accType = '';

  int indexOfSelectedItemHistory = 0;
}

class DataContainer {
  static final DataContainer _instance = DataContainer._internal();

  factory DataContainer() {
    return _instance;
  }

  DataContainer._internal();

  List<FeaturesResultModel> data_list_new = [];

  List<FeaturesResultModel> data_list = [
    FeaturesResultModel(
        90,
        42,
        43,
        20.87974371,
        82.00274423,
        6.502985292000001,
        202.9355362,
        'Babasit, Manaoag, Pangasinan',
        'December 28, 2023 - 11:03 PM',
        'Rice',
        0,
        'Wet Season'),
    FeaturesResultModel(
        79,
        51,
        16,
        25.33797709,
        68.49835977,
        6.586244581,
        96.46380213,
        'Baritao, Manaoag, Pangasinan',
        'December 28, 2023 - 11:04 PM',
        'Maize',
        0,
        'Dry Season & Wet Season'),
    FeaturesResultModel(
        18,
        74,
        15,
        24.9035819,
        22.27512704,
        5.70836603,
        146.4727237,
        'Tebuel, Manaoag, Pangasinan',
        'December 28, 2023 - 11:04 PM',
        'Kidneybeans',
        0,
        'Dry Season & Wet Season'),
    FeaturesResultModel(
        22,
        55,
        24,
        28.56800579,
        57.30636014,
        8.66077954,
        64.53027638,
        'Baritao, Manaoag, Pangasinan',
        'December 28, 2023 - 11:54 PM',
        'Mothbeans',
        0,
        'Dry Season & Wet Season'),
    FeaturesResultModel(
        11,
        74,
        17,
        21.36383757,
        69.92375891,
        6.633864582,
        46.6352865,
        'Baritao, Manaoag, Pangasinan',
        'December 29, 2023 - 1:00 AM',
        'Lentil',
        0,
        'Dry Season & Wet Season'),
    FeaturesResultModel(
        8,
        25,
        36,
        19.91330523,
        94.95031368,
        6.828522375,
        104.0277061,
        'Lelemaan, Manaoag, Pangasinan',
        'December 29, 2023 - 1:30 AM',
        'Pomegranate',
        0,
        'Dry Season & Wet Season'),
    FeaturesResultModel(
        91,
        75,
        55,
        27.48612983,
        76.11239849,
        6.212369363,
        109.2768851,
        'Licsi, Manaoag, Pangasinan',
        'December 29, 2023 - 1:45 AM',
        'Banana',
        0,
        'Dry Season & Wet Season'),
    FeaturesResultModel(
        9,
        21,
        32,
        32.26935342,
        53.56092806,
        5.870116071,
        95.94035356,
        'Poblacion, Manaoag, Pangasinan',
        'December 29, 2023 - 2:45 AM',
        'Mango',
        0,
        'Dry Season & Wet Season'),
  ];
}
