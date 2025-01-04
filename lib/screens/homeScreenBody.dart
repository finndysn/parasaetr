import 'package:agrisense/screens/faq.dart';
import 'package:agrisense/screens/frequency.dart';  // Import the FrequencyScreen
import 'package:flutter/material.dart';

class HomeScreenBody1 extends StatefulWidget {
  HomeScreenBody1({Key? key}) : super(key: key);

  @override
  State<HomeScreenBody1> createState() => _HomeScreenBody1State();
}

class _HomeScreenBody1State extends State<HomeScreenBody1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF3e2723), // Dark brown background for the body
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Container for Predicted Crop Frequencies
              

              // Container for Frequently Asked Questions
              buildCard(
                backgroundColor: Color(0xFF6d4c41), // Light brown color for the card
                content: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FAQScreen(),
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF6d4c41), // Light brown for the header
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'Frequently Asked Question',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'What machine learning model was used?',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),

              // Container for Frequency Screen
              buildCard(
                backgroundColor: Color(0xFF6d4c41), // Light brown color for the card
                content: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FrequencyScreen(), // Navigate to FrequencyScreen
                        ),
                      );
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFF6d4c41), // Light brown for the header
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          'View Crop Frequency',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Click to view the frequency of crops added.',
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard({
    required Color backgroundColor,
    required List<Widget> content,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(12.0), // Rounded corners
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: content,
      ),
    );
  }
}
