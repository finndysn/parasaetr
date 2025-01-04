import 'package:agrisense/main.dart';
import 'package:agrisense/screens/resultScreen.dart';
import 'package:agrisense/supportingData.dart/betaCoefficients.dart';
import 'package:agrisense/supportingData.dart/cropStat.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';
import 'package:agrisense/screens/frequency.dart';


class InputForm1 extends StatefulWidget {
  const InputForm1({Key? key}) : super(key: key);

  @override
  State<InputForm1> createState() => _InputForm1State();
}

class _InputForm1State extends State<InputForm1> {
  TextEditingController nitrogenController = TextEditingController();
  TextEditingController potassiumController = TextEditingController();
  TextEditingController phosphorusController = TextEditingController();
  TextEditingController rainfallController = TextEditingController();
  TextEditingController temperatureController = TextEditingController();
  TextEditingController humidityController = TextEditingController();
  TextEditingController pHController = TextEditingController();
  TextEditingController locationController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final PredictedResult predictedResult = PredictedResult();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3E2723), // Dark brown background
      appBar: AppBar(
        title: Text('Inputs'),
        backgroundColor: Color(0xFF6D4C41), // Light brown header color
        elevation: 0,
        toolbarHeight: 60,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.agriculture,
                  size: 64,
                  color: Color(0xFFB57C55), // Peach color for icon
                ),
                _gap(),
                Text(
                  "Get Recommended Crops!",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                _gap(),
                Text(
                  "Enter your details to get crop recommendations.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[300],
                  ),
                  textAlign: TextAlign.center,
                ),
                _gap(),
                buildTextField(
                    "Location", Icons.location_on, locationController),
                _gap(),
                buildNumericRow(
                    "Nitrogen Level",
                    "Potassium Level",
                    Icons.grass,
                    Icons.eco,
                    nitrogenController,
                    potassiumController),
                _gap(),
                buildNumericRow(
                    "Phosphorus Level",
                    "Rainfall",
                    Icons.local_florist,
                    Icons.waves,
                    phosphorusController,
                    rainfallController),
                _gap(),
                buildNumericRow("Temperature", "Humidity", Icons.thermostat,
                    Icons.opacity, temperatureController, humidityController),
                _gap(),
                buildTextField("pH", Icons.insert_chart, pHController),
                _gap(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFFB57C55), // Peach color for the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 14),
                    elevation: 5,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      getRecommendation();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ResultScreen(),
                        ),
                      );
                    }
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Get Recommendations',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _gap() => const SizedBox(height: 16);

  Widget buildTextField(
      String label, IconData iconData, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: TextStyle(color: Colors.white60), // Light text color
          prefixIcon: Icon(iconData, color: Colors.white70),
          filled: true,
          fillColor: Color(0xFF4E342E), // Dark brown background for text field
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Color(0xFFB57C55), width: 2), // Peach accent color
          ),
        ),
        style: TextStyle(color: Colors.white), // Text color
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter a value';
          }
          return null;
        },
      ),
    );
  }

  Widget buildNumericRow(
      String label1,
      String label2,
      IconData icon1,
      IconData icon2,
      TextEditingController controller1,
      TextEditingController controller2) {
    return Row(
      children: [
        Expanded(
          child: buildTextField(label1, icon1, controller1),
        ),
        SizedBox(width: 10),
        Expanded(
          child: buildTextField(label2, icon2, controller2),
        ),
      ],
    );
  }

  void getRecommendation() {
    double e = 2.7182818;

    double n = double.parse(nitrogenController.text);
    double p = double.parse(phosphorusController.text);
    double k = double.parse(potassiumController.text);
    double temperature = double.parse(temperatureController.text);
    double humidity = double.parse(humidityController.text);
    double pH = double.parse(pHController.text);
    double rainfall = double.parse(rainfallController.text);

    List<String> cropsList = [
      "Apple", "Banana", "Blackgram", "Chickpea", "Coffee", "Coconut",
      "Cotton", "Grapes", "Jute", "Kidneybeans", "Lentil", "Maize", "Mango",
      "Mothbeans", "Mungbean", "Muskmelon", "Orange", "Papaya", "Pigeonpeas",
      "Pomegranate", "Rice", "Watermelon",
    ];

    List<double> correspondingProb = [];

    for (int i = 0; i < cropsList.length; ++i) {
      var betaPart = BetaCoefficients.betas[i][0] +
          BetaCoefficients.betas[i][1] * n +
          BetaCoefficients.betas[i][2] * p +
          BetaCoefficients.betas[i][3] * k +
          BetaCoefficients.betas[i][4] * temperature +
          BetaCoefficients.betas[i][5] * humidity +
          BetaCoefficients.betas[i][6] * pH +
          BetaCoefficients.betas[i][7] * rainfall;
      double prop_i = pow(e, (betaPart)) / (1 + pow(e, betaPart));

      correspondingProb.insert(i, prop_i);
    }

    double maxValue = correspondingProb
        .reduce((value, element) => value > element ? value : element);
    int maxIndex = correspondingProb.indexOf(maxValue);

    predictedResult.nitrogen = n;
    predictedResult.phosphorus = p;
    predictedResult.potassium = k;
    predictedResult.temperature = temperature;
    predictedResult.humidity = humidity;
    predictedResult.pH = pH;
    predictedResult.rainfall = rainfall;

    predictedResult.recommendedCrop = cropsList[maxIndex];
    predictedResult.location = locationController.text;

    DateTime now = DateTime.now();
    String formattedDate = DateFormat('EEEE, MMMM d, y').format(now);
    String formattedTime = DateFormat('h:mm a').format(now);
    String concatFdateTime = formattedDate + ', ' + formattedTime;

    predictedResult.dateTime = concatFdateTime;
    predictedResult.certaintyLevel = 0;
    predictedResult.season = CropStat.cropNameSeason[cropsList[maxIndex]].toString();

    String recommendedCrop = cropsList[maxIndex];

    addCropToFrequency(recommendedCrop);

  }
}
